# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paulrobello
_pkgname=termflix
pkgname=${_pkgname}-bin
pkgdesc="Terminal animation player with 43 procedurally generated animations, multiple render modes, and true color support"

pkgver=0.4.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('e3b26b103f9286c86bc6ec429df0572d20a00d9548b9ea04cc68e8925fa79bf6'
            '93ae6ba13f66e259f90f83bc0cb8c218a5891858ac0cb168b7d3835fd636c150')
sha256sums_x86_64=('f0bf068ed5c05fc005eb6204442963ed9e51a1fb1ef143b6ba673860fe9f546f')
sha256sums_aarch64=('ba3a0ca36f5b4868310f109171333133c21d80c98c53824b4f9f8863ea3d6cb5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
