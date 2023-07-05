# Maintainer: redtide <redtid3@gmail.com>

_pkgname=icon-theme-nuovext
pkgname=nuovext-icon-theme
pkgver=0.1.1
pkgrel=1
pkgdesc="nuoveXT2 icon theme"
arch=('any')
url="https://github.com/redtide/$_pkgname"
license=('LGPL3')
depends=('gtk-update-icon-cache')
install=nuovext-icon-theme.install
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
