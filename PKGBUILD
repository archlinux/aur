# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Andy Hauser <andy-aur@splashground.de>

pkgname=rxp
pkgver=1.5.0
pkgrel=3
pkgdesc="a validating XML parser written in C"
url="http://www.cogsci.ed.ac.uk/~richard/rxp.html"
license=("GPL")
arch=(i686 x86_64)
options=(!libtool)
source=("http://ftp.de.debian.org/debian/pool/main/r/rxp/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('5f6c4cd741bbeaf77b5a5918cb26df2f')


build() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
