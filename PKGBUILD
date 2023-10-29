# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>

pkgname=minidump-stackwalk
pkgver=0.18.0
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('3bf0694b81cd5a100d7a6d85afb5b6278e6b4c35cf115842eccb6052ec528f8b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  install -D target/release/minidump-stackwalk -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
