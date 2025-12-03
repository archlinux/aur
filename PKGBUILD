# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=crit
pkgname=${_pkgname}-bin
pkgver=0.0.11
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Rust cross-compiler"
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
sha256sums=('2b43d239b29042bacfd334d85f4745a4a1c38032e764c553d4547d0410fe9b0b'
            'f6b5c38c03788a96d35470441d55587b0475e948896d59b950f0ae8e95067f55'
            '57f53599a9a2272ea3ac34a2ca701bb512fec522b905ef5fc06671cd1636eeec')

BIN_FOLDER="${_pkgname}-${pkgver}/${CARCH}-unknown-linux-${_clib}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
