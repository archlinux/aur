# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ilastik
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
sha256sums=('b4520f1e90b82c6824df941878e62df320f4e9815d00ee4444feed370b9e2574'
            '0c9ff539b5d1486199456ffcd8b3d63ce1be4459811b9af594c9b96a2d374b86')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"

	cp ilastik.desktop "${pkgdir}/usr/share/applications/ilastik.desktop"
	sed -i "s/PKGVER/$pkgver/g" "${pkgdir}/usr/share/applications/ilastik.desktop"

	cp ilastik-${pkgver}-Linux/LICENSE* \
		"${pkgdir}/usr/share/licenses/${_pkgname}/."

	mv "ilastik-${pkgver}-Linux" "${pkgdir}/opt/ilastik"
}

