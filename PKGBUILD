# Maintainer: Leonardo Brondani Schenkel <leonardo at schenkel dot net>
# Contributor: Feufochmar <feufochmar.gd@gmail.com>
pkgname=libdsk
pkgver=1.5.19
pkgrel=1
pkgdesc="A library for accessing floppy drive and disc images files"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.seasip.info/Unix/LibDsk/index.html"
license=('LGPL')
depends=('zlib' 'bzip2')
source=(http://www.seasip.info/Unix/LibDsk/$pkgname-$pkgver.tar.gz)
sha256sums=('5bcc39a3dacaff20a2a509df9f880c3b00d9fbd59e5771b9deae61d9795ebe41')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
