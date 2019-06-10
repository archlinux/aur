# Maintainer: RedTide

pkgname=nuovext-icon-theme
reponame=icon-theme-nuovext
pkgver=0.1.0
pkgrel=2
pkgdesc="nuoveXT2 icon theme"
arch=('any')
url="https://github.com/redtide/$reponame"
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('git')
install=nuovext-icon-theme.install
source=(git://github.com/redtide/$reponame.git)
md5sums=('SKIP')

build() {
  cd $reponame
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $reponame
  make DESTDIR="$pkgdir" install
}
