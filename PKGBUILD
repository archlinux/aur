# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hitblast
_pkgname=cornelli
pkgname=${_pkgname}-bin
pkgdesc="Write to your future self"

pkgver=1.1.0
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
sha256sums=('a64e0ba65acf699df3f07775789be56d1b98a1a437eb3062a2dbd4babf6fe39f'
            'd39ad7852fd6ecd12ca2b12cc3167197dd8ca3e0d5dcdfe928f74bf06c4cfd85')
sha256sums_x86_64=('cc3f5e4319a6be26d23299fbe63278a8f513282c0edb30b901141855bc08772f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname##cor}" "${pkgdir}/usr/bin/${_pkgname##cor}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
