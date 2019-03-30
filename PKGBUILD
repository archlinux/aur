# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript-ide
pkgver=0.6
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
source=("https://github.com/bipscript/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('3b86c7d546035498daeacdcf4fe4e52f')

prepare() {
	cd "$pkgname-$pkgver"
	./version.sh
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 "$pkgname.pro"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

