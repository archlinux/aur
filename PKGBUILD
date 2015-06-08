# Contributor: Francesco Colista <francesco.colista@gmail.com>
# Maintainer: Francesco Colista <francesco.colista@gmail.com>
pkgname=archmbox
pkgver=4.10.0
pkgrel=0
pkgdesc="A simple email archiver written in perl"
arch=('any')
url="http://adc-archmbox.sourceforge.net/"
license=('GPL')
depends=('perl')
optdepends=('mailutils' 'mbox-tools')
source=(http://downloads.sourceforge.net/project/adc-archmbox/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('44f9f155d45d2eae4b9de33314adf841')
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr 
  make || return 1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
