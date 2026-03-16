# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=rockhopper
pkgname=${_pkgname}-bin
pkgver=0.0.23
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Metapackage generator"
arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tgz")
sha256sums=('db72c78a6b79c3434f488fd081a70b239a5bd837c2eaff85b9eaf2cea146def7'
            'ac7572d3e960dd6554294a9b610f9495d263f0b09d7cf9043f29e5d58f6f05ee')
sha256sums_x86_64=('df76d849f1d509209ead30d7e98c69bb719988c53fd882f70fc4cb5fc5024f4e')
sha256sums_aarch64=('cb1f60bb427bc5f1685933cabb68296b39b16c34028a05b568367cf298188cf6')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
