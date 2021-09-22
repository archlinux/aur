# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=gistit
pkgver=0.1.4
pkgrel=1
pkgdesc='Send content from console/file to GitHub gist'
arch=('any')
url='https://github.com/jrbasso/gistit'
license=('GPL2')
depends=('curl' 'jansson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jrbasso/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('983684664d9cac5237558c7b29b73851')


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
