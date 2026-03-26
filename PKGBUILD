# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rohansx
_pkgname=wardn
pkgname=${_pkgname}-bin
pkgdesc="Credential isolation for AI agents (agents never see real API keys - structural guarantee, not policy)"

pkgver=0.4.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('753c056385053c15940a0e5d29a3a7cba0520a4f19aa7d82b50b16508434e7f2'
            '7f6af1b49f6b14bbc5d462025fcf48eecce61ec01366aef8dc506d2c9dc115f2')
sha256sums_x86_64=('3359653abcc8461e7cbe33c7e45f7590d1d4b609a516cd94ba7694359351a3cc')
sha256sums_aarch64=('f498087a5ce0aee4f1b1a931d66dbf8672ebfac749a95e2c7b375459fa45678d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
