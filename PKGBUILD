# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=kirill
pkgname=${_pkgname}-bin
pkgver=0.0.10
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A JSON document integrity checker"
arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tgz")
sha256sums=('7949af9e82916ec265e51b050b4fd13662cb9e98bc794b1961bde526d5b21e26'
            '5891781734416d32b3ee9412671be9b1cab9310ccb9c20bacd435c4eb88f7861')
sha256sums_x86_64=('727abccc9ac6841c4a468d204abe5547fbfae9513701fcdf604d49db08167ea4')
sha256sums_aarch64=('a6f174a4be4159a8bbda5dd09e32413a1a85b5c6ee8f68f9d8299ccf9ac35d2b')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
