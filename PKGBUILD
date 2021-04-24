# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=fastmod
pkgver=0.4.2
pkgrel=1
pkgdesc="A fast partial replacement for the codemod tool"
arch=('x86_64')
url="https://github.com/facebookincubator/fastmod"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5afb4c449aa7d1efe34e0540507fc1d1f40f7eba0861b2bb10409080faeffc4a')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
