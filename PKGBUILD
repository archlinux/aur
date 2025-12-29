# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=fcsonline
_pkgname=drill
pkgname=${_pkgname}-bin
pkgver=0.9.0
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
            '74bf75b98e4709133bee00f4075daad23ac1d3f5ad181ac9279b6450ea5561a8'
            '846fea0a18d39c25f5d5d2feed3d37224eb6a81672081c27d4596a6ea5fc74ac')
sha256sums_x86_64=('0ad776c531d4f8a4e650549e7b20c7e20a938871bb29afd6c2fd1b0f0ae46eb1')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SYNTAX-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SYNTAX.md"
}
