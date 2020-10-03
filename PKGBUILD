# Maintainer: Colean <colean@colean.cc>
pkgname=bipscript-ide
pkgver=0.9
pkgrel=1
pkgdesc="IDE for the bipscript language"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'qt5-base')
makedepends=('git' 'qt5-tools' 'ruby')
provides=("bipscript-ide")
conflicts=("bipscript-ide")
source=("https://gitlab.domainepublic.net/bipscript/ide/-/archive/v$pkgver/ide-v$pkgver.tar.gz")
md5sums=('47b77eb323957ef5582a302858ad9d5a')

prepare() {
	cd "ide-v$pkgver"
	./version.sh v$pkgver
}

build() {
	cd "ide-v$pkgver"
	qmake-qt5 "$pkgname.pro"
	make
}

package() {
	cd "ide-v$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

