# Maintainer: Will Elliott <troutcobbler@gmail.com>

pkgname=eww
pkgver=0.3.0
pkgrel=1
pkgdesc="A standalone widget system made in Rust."
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(rustup git)
depends=(gtk3)
conflicts=(eww-git)
source=("git+${url}#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  rustup toolchain install nightly
  cargo +nightly build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/eww "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
