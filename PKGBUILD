# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=chandler
pkgname=${_pkgname}-bin
pkgver=0.0.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="TAR normalizer"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
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
sha256sums=('2a0aa990192429d75a73f2f7083546fab392ca1be0a8a5ae53034a21d7b9b99c'
            '1cc69d546a58a232825aca67c2338769669ac25c393d5e7a6da3f67a7f67bdd1'
            '101d1171849ca84c68bc5a59bbd8e54f18a4f8ab7e9bdc3d3fdfb7c173ffbf7f')

BIN_FOLDER="${_pkgname}-${pkgver}/${CARCH}-unknown-linux-${_clib}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${BIN_FOLDER}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
