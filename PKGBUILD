# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=fcsonline
_pkgname=drill
pkgname=${_pkgname}-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('GPL-3.0')

depends=('openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SYNTAX-${pkgver}.md::${_urlraw}/SYNTAX.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2'
            '5d796a7eac589a829e9ba49d3665f57581c1cbc274a52303e815d741e26da2a1'
            '29ce2c427351bda2cead36e1624f9ee5e63411ecb81e51d01cb968130e2a00b0')
sha256sums_x86_64=('3e7ba8074098d20ade4ec10adac9a070665eb2100a9365024aad9fe6f796b134')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SYNTAX-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SYNTAX.md"
}
