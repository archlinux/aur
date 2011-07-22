# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Andy Hauser <andy-aur@splashground.de>

pkgname=rxp
pkgver=1.5.0
pkgrel=2
pkgdesc="a validating XML parser written in C"
url="http://www.cogsci.ed.ac.uk/~richard/rxp.html"
license=("custom")
arch=(i686 x86_64)
options=(!libtool)
source=("http://ftp.fortunaty.net/distfiles/$pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('5f6c4cd741bbeaf77b5a5918cb26df2f'
         '2a5223a66826f1d1e39eb9c77af9ea88')


build() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/licenses/$pkgname
  install "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname
}
