# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hitblast
_pkgname=cornelli
pkgname=${_pkgname}-bin
pkgdesc="Write to your future self"

pkgver=1.4.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')
provides=("${_pkgname##cor}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-ubuntu-latest.tar.gz")
sha256sums=('cf69e70652912b5a51e787bb58b8d07ef2eeff0258ba4b89ff09e8090545fcfe'
            '900a1e91f22e88a2e9aa8f580ceff4013e96238dac9a36d5fb6b9c9706dc32bb')
sha256sums_x86_64=('993693a61aac32f355aed3c2b46ef0c2d95d8529d85c402fb6189b1cd303a90c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname##cor}" "${pkgdir}/usr/bin/${_pkgname##cor}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
