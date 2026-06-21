# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.3.1
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
sha256sums_x86_64=('9cbaeac6e2bd8ae3423b02615da6876db0b17ebf43fa6d3eca2ca349b6817bbe')
sha256sums_i686=('0059331a1c3cc74a79b0fd30bf4e6ac76e1ce2ed63b00a71b2830107300e28fb')
sha256sums_aarch64=('0c06cfcdf374795de12b809f4ca0b0918733bb416d9b6cd397553dba7eef86d5')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
