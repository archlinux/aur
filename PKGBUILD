# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=gistit
pkgver=0.1.3
pkgrel=1
pkgdesc='Send content from console/file to GitHub gist'
arch=('any')
url='https://github.com/jrbasso/gistit'
license=('GPL2')
depends=('curl' 'jansson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jrbasso/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('536cca086b1c36023a0d177f874b7727')


build() {
  cd $pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
