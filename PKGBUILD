# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=fastmod
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast partial replacement for the codemod tool"
arch=('x86_64')
url="https://github.com/facebookincubator/fastmod"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0e0c2d50489c90cb8c8904772be2e9d31353fbed814d9088ee6013c27c2d111b')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
