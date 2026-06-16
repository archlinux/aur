# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=3.2
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
sha256sums=('db7f7ce8121ec5084ef74e60e72d22f165f6d7d6664a1af5ccdbb956e1f38793'
            '9a48f9f4d5049a011fafdd9903adb42d0f864b4f43afd530dd855fc1f38dbeb3')
sha256sums_x86_64=('47debb6f2005d257f6e1a4183e07f49bd45eb77baff248a37e9c045552b056fc')
sha256sums_aarch64=('b478197355871dfe73d679c81a404fcf6743dd8cdd3f473ee4e070ae431ceb56')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_debian_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
