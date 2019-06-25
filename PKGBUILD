# Maintainer: zetaPRIME <qmanxt at gmail dot com>
pkgname=xybrid-git
_realname=xybrid
pkgver=3282b2e
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
  # time of latest commit
  git describe --always | sed 's|-|.|g'
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
