# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=SimpleArchiver
_pkgauthor=Stephen-Seo
_pkgname=${_appname,,}
pkgname=${_pkgname}-bin
pkgver=2.6.2
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
            'f98310e382ea2f89c9fdb976a9ced23473182e0251f975fc9daba1b0b216b273')
sha256sums_x86_64=('91fcb48e444c1f22a798afa9adb58676e6773f0fb3ee34d110b25bd35d9b5596')
sha256sums_aarch64=('8ec9ac756e5bf235e8949202309f410951277fcfd08131a2d4f7bdb9a7d5fabd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_debian_${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
