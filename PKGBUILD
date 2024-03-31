# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=fastmod
pkgver=0.4.4
pkgrel=1
pkgdesc="A fast partial replacement for the codemod tool"
arch=('x86_64')
url="https://github.com/facebookincubator/fastmod"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b438cc7564ef34d01f27cdd3cd50ee66a9915b9c50939ca021c6bee2e9c1f069')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
