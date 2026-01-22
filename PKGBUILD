# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=serkanyersen
_pkgname=dotstate
pkgname=${_pkgname}-bin
pkgdesc="A modern, secure, and user-friendly dotfile manager"

pkgver=0.2.16
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7efa2e24bd29cabcff7c83ee7695a8a53701d94974a4284537be6f4f1b0020a0'
            'cfd4a57ed510c26491abb8425eed78dca73bf17245fca6cc48102150b88bd725')
sha256sums_x86_64=('23ad3c620a99e56a2c18a89c991685787ea9e4bfffa09580e46a53e808b59f08')
sha256sums_aarch64=('e7c4ccddb8ac0930a9f9719e0b7c5ddad563711ed6fb1e0c62faed34c9b26c4c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
