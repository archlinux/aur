# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddgst
pkgname=${_pkgname}-bin
pkgver=3.0.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hashing utility with a twist"
arch=('x86_64')
_barch=('x86_64-linux-musl-static')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('6d489af6292662d9e36d34ce49423784984a5f6e41d7b58f49b01264df59fa03'
            '40812fa1b361a114b74d00f27918a81e74c93c8cd03df1e8808e83e1632108fb')
sha256sums_x86_64=('bc6dcaab4d679393493901b286cac05a21c998c487e13531a1e1e4a3eb8c7f9c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
