# Maintainer: zetaPRIME <qmanxt at gmail dot com>
pkgname=multibound-git
_realname=multibound
pkgver=r22.a55331c
pkgrel=1
pkgdesc="Starbound profile launcher"
arch=('any')
url="https://github.com/zetaPRIME/MultiBound2/"
license=('LGPL2')
depends=('qt5-base' 'qt5-declarative' 'qt5-webengine')
makedepends=('git' 'qt5-tools')
conflicts=('multibound')
source=($_realname::git+https://github.com/zetaPRIME/MultiBound2.git)
md5sums=('SKIP')

pkgver() {
  cd $_realname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}	

build() {
	cd $_realname/multibound2
	qmake multibound2.pro
	make
}

package() {
	cd $_realname/multibound2
	make INSTALL_ROOT="$pkgdir" install
} 
