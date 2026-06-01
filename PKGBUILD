# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=sqly
pkgname=${_pkgname}-bin
pkgver=0.23.0
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
sha256sums_x86_64=('2a50a5d05082d36c99ad73b9081a49263a22e7aadf3d68ad24f0999e3e063096')
sha256sums_aarch64=('309bdcfa99a98346a2ee825b006de49a7cf297ccc59328db88fc611f54d08855')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
