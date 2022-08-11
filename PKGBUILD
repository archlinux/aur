# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=fastmod
pkgver=0.4.3
pkgrel=1
pkgdesc="A fast partial replacement for the codemod tool"
arch=('x86_64')
url="https://github.com/facebookincubator/fastmod"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0c00d7e839caf123c97822542d7f16e6f40267ea0c6b54ce2c868e3ae21de809')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
