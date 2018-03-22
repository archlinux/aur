# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ilastik
pkgname=${_pkgname}-bin
pkgver=1.3.0
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
sha512sums=('6c8caa1f1aa9649ccc5f413b5d65b149d400f039e903c17cf97d6cfbe7db241c6f2611216f8425410095b4b7932c75b9dbe1c509a71c2f734cb69bb236fc64a7'
            '8d21c1114a857e73ce9a84afd5772ce0bcb84c6f3af24ba1c25bf1b0ef4e6e5008615fe65c511b791af15046907dc87e52b03e8f6c7d35d8a07777c45bece679')

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

