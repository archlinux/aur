# Maintainer: Raphael Scholer <rscholer@gmx.de>
# Contributor: tomberry88 <tomberry@live.it>
# Contributor: Gour-Gadadhara Dasa <gour@atmarama.net>
pkgname=xfce4-kbdleds-plugin
pkgver=0.2.2
pkgrel=1
pkgdesc="Xfce keyboard LEDs panel plugin"
arch=('i686' 'x86_64')
url="ihttps://github.com/oco2000/xfce4-kbdleds-plugin"
license=('GPL2')
conflicts=("xfce4-kbdleds-plugin-git")
depends=('xfce4-panel')
makedepends=('intltool' 'xfce4-dev-tools')
source=("https://github.com/oco2000/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        deprecation_fixes.patch)
install="${pkgname}.install"
sha256sums=('3b031632cb3ab2b01b93dd3613512db55bf1293422995ec7ea3898318a878661'
            'c3447e8a972fb263731a3c91b104b2cb706330069819ed0822df8689f4663601')

prepare() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/deprecation_fixes.patch"
}



build() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
