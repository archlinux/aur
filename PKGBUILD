# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ilastik
pkgname=${_pkgname}-bin
pkgver=1.3.3post2
pkgrel=1
pkgdesc='The interactive learning and segmentation toolkit'
arch=('x86_64')
url='http://ilastik.org'
license=('GPL')
provides=()
depends=()
makedepends=()
optdepends=()
options=('!strip')
conflicts=()
source=("http://files.ilastik.org/ilastik-${pkgver}-Linux.tar.bz2"
        "ilastik.desktop")
sha256sums=('00ce362c701f324e22ece993ea0b631dd675ac7e39be8447d5e9ba2a678ae66a'
            '0c8c5c9b5c310448fda82c5b89a1957f56e134ef63a7b579c006abf18dfd8bd2')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"

	cp ilastik.desktop "${pkgdir}/usr/share/applications/ilastik.desktop"
	sed -i "s/PKGVER/$pkgver/g" "${pkgdir}/usr/share/applications/ilastik.desktop"

	cp ilastik-${pkgver}-Linux/ilastik-meta/ilastik/LICENSE* \
		"${pkgdir}/usr/share/licenses/${_pkgname}/."

	mv "ilastik-${pkgver}-Linux" "${pkgdir}/opt/ilastik"
}

