# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libsteel
_pkgver=1.0-14ec81fbffba79ba2bb663b4966af1d0e1b93e3f
pkgver=1.0
pkgrel=1
pkgdesc="library functions for steel"
url="https://www.steelpasswordmanager.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmcrypt' 'mhash' 'sqlite')
source=(https://gitlab.com/Rosvall/libsteel/repository/archive.zip?ref=v1.0)
md5sums=('b73e93f1b4a3a321cc07dbae1c6db4d8')

build() {
  cd "$srcdir"/$pkgname-v$_pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-v$_pkgver
  install -d "$pkgdir/usr/lib"
  make PREFIX="$pkgdir/usr" install
}
