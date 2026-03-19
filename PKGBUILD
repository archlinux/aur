# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=2.7.2
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
            'c6d5f9ad687edeff4ff412d5d4eb8a6bcb755ca7a923d32cf5ee5dbb6555ffcf')
sha256sums_x86_64=('963d9cf3e17566ddc45d81d3bbbe3ac7f2167d27b835273330f1aec0ade376ec')
sha256sums_aarch64=('5a8f461212bb21d127337db7b0249f2a0a1c4643e6cd909afab1d74df7324bc4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_debian_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
