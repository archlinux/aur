# Maintainer: zetaPRIME <qmanxt at gmail dot com>
pkgname=aludel-git
_realname=aludel
pkgver=r4.8897d0d
pkgrel=1
pkgdesc="lightweight, Qt-based notification daemon a la dunst"
arch=('any')
url="https://gitlab.com/zetaPRIME/aludel/"
license=('LGPL2')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
conflicts=('qt5ct-refresh')
source=($_realname::git+https://gitlab.com/zetaPRIME/aludel.git)
md5sums=('SKIP')

pkgver() {
  cd $_realname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}	

build() {
	cd $_realname
	qmake $_realname.pro
	make
}

package() {
	cd $_realname
	make INSTALL_ROOT="$pkgdir" install
} 
