# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tjblackheart
_pkgname=andcli
pkgname=${_pkgname}-bin
pkgver=2.8.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A 2FA TUI for your shell"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[1]}")
sha256sums=('d45afd6fb9c249b4daef3c0362a71ff3c9cfa607c8162c29af42a5546e9b3246'
            '7b58c12721cef0b66e00a010ec0a571693a9b0d6ca9561eb5a9ca4971ea26f5e')
sha256sums_x86_64=('93c402f842c33ba70f2795e0aa92b96bfdfb98d86db4c756d6733df83cfd3187')
sha256sums_aarch64=('66bb80906c1b20166aff28e383dc522536ba0797a89b1975c8f6c9baa5dfbe20')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
