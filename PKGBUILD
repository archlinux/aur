# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>

pkgname=minidump-stackwalk
pkgver=0.17.0
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('e6f294ee946b2870a9661cb3592d9a53ad36145c18eee60a301a6c9b1f07ed22')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  install -D target/release/minidump-stackwalk -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
