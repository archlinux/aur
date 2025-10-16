# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=crit
pkgname=${_pkgname}-bin
pkgver=0.0.10
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
sha256sums=('4a204cb4e820161ab7401772d2bca9c09ce15e8a74b5a81a4f403932310aa7f1'
            'b26e5f8c66199e2cb8e7b1d09cb55de82ca5329ce1a7c7a98a2b2507d9bb111f'
            '57f53599a9a2272ea3ac34a2ca701bb512fec522b905ef5fc06671cd1636eeec')

BIN_FOLDER="${_pkgname}-${pkgver}/${CARCH}-unknown-linux-${_clib}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
