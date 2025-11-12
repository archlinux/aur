# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.7.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
_barch=('x86_64-linux-musl-static')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('38368893e6b716941036d2175add984a5501dd183ba9f26aaa5cc86e2bdddf73'
            'e30195f635887c1cb600c00fa6ffb29804d2664c6d4d955c4a2d34ff0354d3d4')
sha256sums_x86_64=('a5f8c1c99b65d0a39a1f23087e7de6ed9ef4944e18abf19ee8ee37421c886e3a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
