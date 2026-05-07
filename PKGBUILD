# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paulrobello
_pkgname=termflix
pkgname=${_pkgname}-bin
pkgdesc="Terminal animation player with many procedurally generated animations, multiple render modes, and true color support"

pkgver=0.5.1
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
sha256sums=('fe71960229e8f94dfe640dd0406d8c0c26af779b01e6759786667c052420f4db'
            '93ae6ba13f66e259f90f83bc0cb8c218a5891858ac0cb168b7d3835fd636c150')
sha256sums_x86_64=('ca31809668b8cff7a6df244167d30c703341524acf0c7e9ca3e3f1f9880da45b')
sha256sums_aarch64=('2d199283af0c903a5ed8cf9355f33133e57c2d8ff1c0092c707f3fc12d9531e9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
