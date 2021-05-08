# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=cvsps
pkgver=3.13
pkgrel=3
pkgdesc="Generating 'patchset' information from a CVS repository"
url="http://www.catb.org/esr/cvsps/"
license=('GPL')
arch=('x86_64')
depends=('zlib')
makedepends=('asciidoc')
source=("http://www.catb.org/~esr/cvsps/cvsps-${pkgver}.tar.gz")
sha512sums=('9fe2be4839c7a6f31a788102fd6ebb1e2e0693f09a4dad2bca5cd5d0788088eb34388d592778f04bcfec9817e3ffffb66d70db9aa47996d3bd1c45cf7cd8464f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
