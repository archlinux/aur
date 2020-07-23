# Contributor: Feufochmar <feufochmar.gd@gmail.com>
pkgname=libdsk
pkgver=1.5.12
pkgrel=1
pkgdesc="A library for accessing floppy drive and disc images files"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.seasip.info/Unix/LibDsk/index.html"
license=('LGPL')
depends=('zlib' 'bzip2')
source=(http://www.seasip.info/Unix/LibDsk/$pkgname-$pkgver.tar.gz)
md5sums=('4a30389755036958a5534b28255ea004')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
