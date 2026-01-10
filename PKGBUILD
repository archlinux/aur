# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.13.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Terminal app for keeping up with live football/soccer. Check scores, match events, and stats from major leagues without leaving your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4dc0a5daa325b37f64f50f726db4dd94342dcfec49bd0fe80266a0ef59953bfa'
            'c10673e1b0ce6aaa1391d1766e90ed39b4e9af0678754aa15732e16a3c67c10d')
sha256sums_x86_64=('77c876e36873f603a160092f4e3b10dbbce45458280f7496f834d30501c20277')
sha256sums_aarch64=('0b44c8de5e9cd7d4d2ae1289fee905635fdd10b5684ee167c08a8bc1debc2ef0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
