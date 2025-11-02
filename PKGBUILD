# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=allocata
_pkgname=sip
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Alternative to git clone for selective GitHub downloads"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('f2e7a98a3a69d6b1505b940be558b2d76c614d86d7c51c9a8486943728695c6f'
            '71c0b4fdd7d42bc47beb55eeb1e4ecc4f82fca8e2c054beebe83cef5dc376d3a')
sha256sums_x86_64=('e39b6c2966941369a01b5c0faa79697cba6d3237235ac33ca26cbed9f037fe95')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
