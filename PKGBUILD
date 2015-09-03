# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt-color-widgets-common
pkgver=0.r171.24d47d5
pkgrel=1
pkgdesc='Common files used by qt4- and qt5-color-widgets packages'
arch=('any')
url='https://github.com/mbasaglia/Qt-Color-Widgets'
license=('LGPL3')
makedepends=('git')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Widgets.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $pkgname

	install -d "${pkgdir}/usr/include/QtColorWidgets"
	find 'src' -type f -iname '*.hpp' -exec install -Dm644 {} "${pkgdir}/usr/include/QtColorWidgets/" \;
	find 'include' -type f -iname '*.hpp' -exec install -Dm644 {} "${pkgdir}/usr/include/QtColorWidgets/" \;
}
