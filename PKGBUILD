# Maintainer: yugrotavele <jkluebs at luebsphoto dot com>

pkgname=dymo-cups-drivers
pkgver=1.4.0.5
pkgrel=1
_archive_ver=1.4.0
url=http://global.dymo.com/
pkgdesc="Official Dymo supplied Linux Cups drivers for LabelWriter series"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libcups')
source=(http://download.dymo.com/Software/Linux/${pkgname}-${_archive_ver}.tar.gz)
sha1sums=('3576496a1afd5a0e076821081a1919468b50d347')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
