# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=sqly
pkgname=${_pkgname}-bin
pkgver=0.14.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Eaisly execute SQL against CSV/TSV/LTSV/JSON and Microsoft Excel™ with shell"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.deb")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.deb")
sha256sums_x86_64=('874ef5dc004a097453c4a71260d605c268d1a02de14ed8342da712df2e09af05')
sha256sums_aarch64=('40b3486d8c64cc88b9e968e50eb04a28c91fd25be88939683b85d909ca6af62a')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
