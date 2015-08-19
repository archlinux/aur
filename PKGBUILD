# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt-color-picker-common
pkgver=0.r92.2e1ec20
pkgrel=3
pkgdesc='Common files used by qt4- and qt5-color-picker packages'
arch=('any')
url='https://github.com/mbasaglia/Qt-Color-Picker'
license=('LGPL3')
makedepends=('git')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Picker.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname

	install -d "${pkgdir}/usr/include/QtColorPicker"
	find 'include' -type f -exec install -Dm644 {} "${pkgdir}/usr/include/QtColorPicker/" \;
}
