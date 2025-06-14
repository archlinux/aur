# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=opencl-language-server
pkgname=${_pkgname}-bin
pkgver=0.6.3
pkgrel=1
epoch=
pkgdesc="OpenCL language server"
arch=('x86_64')
url="https://github.com/Galarius/opencl-language-server"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${url}/releases/download/${pkgver}/${_pkgname}-linux-x86_64.tar.gz"
    "${url}/releases/download/${pkgver}/licenses.tar.gz"
)
noextract=()
sha256sums=('aa24259e40faeecc66084106cfbab5b7efec83be7b730c93a3f9b147a1351f9d'
            'eef9d09c425353ba8070be1b6abdf66c56d15e401d1dd771f66d3f2339bd3f45')

package() {
	cd "${srcdir}"

	install -D -m644 \
		"${srcdir}/licenses/${_pkgname}/${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m755 \
		"${srcdir}/${_pkgname}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}

