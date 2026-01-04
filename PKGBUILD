# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hitblast
_pkgname=cornelli
pkgname=${_pkgname}-bin
pkgdesc="Write to your future self"

pkgver=1.2.0
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
            '115503e692b01b9a1dc67b20ca7537a75e22109142bbee199129dfc810c99378')
sha256sums_x86_64=('7d09d20a742eef2006270da3df4beb00d2dc29106b92a721e58f17eaf7b8a792')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname##cor}" "${pkgdir}/usr/bin/${_pkgname##cor}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
