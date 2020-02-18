# Maintainer: zetaPRIME <qmanxt at gmail dot com>
pkgname=qt5ct-refresh-git
_realname=qt5ct-refresh
pkgver=r3.94433c7
pkgrel=1
pkgdesc="Simple utility to force-refresh qt5ct style settings"
arch=('any')
url="https://gitlab.com/zetaPRIME/qt5ct-refresh/"
license=('Unlicense')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
conflicts=('qt5ct-refresh')
source=($_realname::git+https://gitlab.com/zetaPRIME/qt5ct-refresh.git)
md5sums=('SKIP')

pkgver() {
  cd $_realname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}	

build() {
	cd $_realname
	qmake qt5ct-refresh.pro
	make
}

package() {
	cd $_realname
	make INSTALL_ROOT="$pkgdir" install
} 
