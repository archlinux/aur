# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Update binaries installed by \"go install\" with goroutines"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.deb")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.dev::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.deb")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.deb")
sha256sums_x86_64=('2ea19f5c90a02d0ecfab4dd782681da1865b9ffb6852b63bf32ee715c0fee231')
sha256sums_i686=('6b6eaa9d252de12ed7fadeefe15a129feed263bf1a21b71bf0b02e272dd644ac')
sha256sums_aarch64=('2b1dc2c957e1eed3dac80ff44ebf1eb71193fec4ffde61f6411e92716560478a')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
