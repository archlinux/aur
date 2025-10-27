# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=1.36
pkgrel=1
pkgdesc="An alternative to tar"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('ISC')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_debian_${arch[0]}")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_debian_${arch[1]}")
sha256sums=('bf08b2cc97b00a4d926624446506713f9e88abaeeedbfcb9f7e1d8e290fe6860'
            '55a4a08aace4b3308b34edeb0d1f8789f39f70f364d6a28c3191c11c6df09659')
sha256sums_x86_64=('26da0185cb9b501e1babe6eb6858c047a475c555e5ec25b775be02c3807967ea')
sha256sums_aarch64=('a108279c7ebcc089482ab856a8dd5bd249959242b746cbca149f7ceafb8b66ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_debian_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
