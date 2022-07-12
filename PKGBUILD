# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>

pkgname=minidump-stackwalk
pkgver=0.11.0
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('6a611f25c59de2656ed37d25f16d69317c3fe581cb191f277339a73691f2a960')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D target/release/minidump-stackwalk -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
