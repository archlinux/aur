# Contributor: Feufochmar <feufochmar.gd@gmail.com>
pkgname=libdsk
pkgver=1.5.14
pkgrel=1
pkgdesc="A library for accessing floppy drive and disc images files"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.seasip.info/Unix/LibDsk/index.html"
license=('LGPL')
depends=('zlib' 'bzip2')
source=(http://www.seasip.info/Unix/LibDsk/$pkgname-$pkgver.tar.gz)
md5sums=('83ab6e658c12b9c9c97fcf9a1c745bf4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
