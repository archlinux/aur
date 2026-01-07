# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=kirill
pkgname=${_pkgname}-bin
pkgver=0.0.7
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A JSON document integrity checker"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
_clib='gnu'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}"{,-git})

source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}.tgz"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
sha256sums=('af163b6e5a9939e17f5a9a9575d6412c48b9cd0768acc20e084f436b1030e1e1'
            'a8e71254099fdc3ac4c0ae1387799a8926d2fcc611a7c44d251629e5812f980f'
            '101d1171849ca84c68bc5a59bbd8e54f18a4f8ab7e9bdc3d3fdfb7c173ffbf7f')

BIN_FOLDER="${_pkgname}-${pkgver}/${CARCH}-unknown-linux-${_clib}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
