# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.2.0
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
sha256sums_x86_64=('15aee73ec8769dbec91667768c8f3e1a8f9b03f9cc9d5b2b843ee4e19cbc6a2a')
sha256sums_i686=('4b87c19aea1f32966bb39f68ef6c138eee49baa857a91bcee8c5cc6e25f6d379')
sha256sums_aarch64=('a23f43b73bca366b1e202cac265d037b884fa37e12ec2c0d8aa01b6737bfe68f')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
