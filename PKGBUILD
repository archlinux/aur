# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=hysteresis
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0.5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/sgt0/vapoursynth-hysteresis'
license=('MIT')
depends=('vapoursynth')
makedepends=('cargo')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/sgt0/vapoursynth-hysteresis/archive/refs/tags/v1.0.5.tar.gz")
sha256sums=('525c3ace0e3ff6a1091fdaf5fbbaff58ef12576cb39b41cb6deecfd5582a2977')

build() {
  cd "vapoursynth-${_plug}-${pkgver}"
  cargo build --release
}

package() {
  cd "vapoursynth-${_plug}-${pkgver}"

  install -Dm644 target/release/libhysteresis.so "${pkgdir}/usr/lib/vapoursynth/libhysteresis.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE.md"
}
