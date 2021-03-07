# Maintainer: Leonardo Brondani Schenkel <leonardo at schenkel dot net>
# Contributor: Feufochmar <feufochmar.gd@gmail.com>
pkgname=libdsk
pkgver=1.5.15
pkgrel=1
pkgdesc="A library for accessing floppy drive and disc images files"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.seasip.info/Unix/LibDsk/index.html"
license=('LGPL')
depends=('zlib' 'bzip2')
source=(http://www.seasip.info/Unix/LibDsk/$pkgname-$pkgver.tar.gz)
sha256sums=('ed58d5806472dfe484fbd99d3e904a88dcefd6d8366a45e99077efd9d568383b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
