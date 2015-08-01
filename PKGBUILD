# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt-color-picker-common
pkgver=0.r92.2e1ec20
pkgrel=1
pkgdesc='Common files used by qt4- and qt5-color-picker packages'
arch=('i686' 'x86_64')
url='https://github.com/mbasaglia/Qt-Color-Picker'
license=('LGPL3')
makedepends=('git' 'qtchooser')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Picker.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	qmake PREFIX="${pkgdir}/usr"
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install_headers
}
