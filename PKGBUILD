# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dd86k
_pkgname=ddhx
pkgname=${_pkgname}-bin
pkgver=0.8.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Console hexadecimal file viewer"

arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${arch[0]}-linux-musl-static.tar.gz")
sha256sums=('38368893e6b716941036d2175add984a5501dd183ba9f26aaa5cc86e2bdddf73'
            'dd550ae67d7d0cb971fd7fa8f1da703e04f8296853b41edd0f033957ac50d5e0')
sha256sums_x86_64=('2b944139f847adff1553b7cbd9cc4c617a0f02e54e7e495f98c5857e68aee8a1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
