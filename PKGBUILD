# Maintainer: Giulio Girardi <giulio at rapgenic.it>

pkgname=dia2code
pkgver=1.0.0
pkgrel=0
pkgdesc="Small utility used to generate code from a Dia diagram."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://dia-installer.de/dia2code/index.html"
depends=('libxml2')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname+/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('496a8b855c1db4143b40eb11f5adbc30')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
