# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt4-color-picker
pkgver=0.r92.2e1ec20
pkgrel=3
pkgdesc='A user-friendly color wheel widget and dialog for Qt'
arch=('i686' 'x86_64')
url='https://github.com/mbasaglia/Qt-Color-Picker'
license=('LGPL3')
depends=('qt4' 'qt-color-picker-common')
makedepends=('git')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Picker.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	eval "qmake-${pkgname::3} PREFIX=${pkgdir}/usr"
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install_target
}
