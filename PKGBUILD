# Maintainer: zetaPRIME <qmanxt at gmail dot com>
pkgname=xybrid-git
_realname=xybrid
pkgver=r120.c8b0108
pkgrel=1
pkgdesc="hybrid tracker/DAW"
arch=('any')
url="https://gitlab.com/zetaPRIME/xybrid/"
license=('LGPL2')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
conflicts=('xybrid')
source=($_realname::git+https://gitlab.com/zetaPRIME/xybrid.git)
md5sums=('SKIP')

pkgver() {
  cd $_realname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}	

build() {
	cd $_realname/xybrid
	qmake xybrid.pro
	make
}

package() {
	cd $_realname/xybrid
	make INSTALL_ROOT="$pkgdir" install
} 
