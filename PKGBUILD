# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Patrick Hof <patrickhof@web.de>

pkgname=pdfresurrect
pkgver=0.22
pkgrel=1
pkgdesc="tool aimed at analyzing PDF documents"
url="https://github.com/enferex/pdfresurrect"
license=("GPL3")
arch=('x86_64' 'i686')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enferex/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ce36d602c0d7a4ad90d5a6fb3196d7de')


build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
