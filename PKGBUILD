# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nao1215
_pkgname=gup
pkgname=${_pkgname}-bin
pkgver=1.0.0
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
sha256sums_x86_64=('5fbea137eb3036e55af9090e210a90cf697d65fe697d535b2f3a60f2f14085d1')
sha256sums_i686=('0223542a76e68f7b3c9c0aa2307572a549cfa74060f9e70b08074e4583ffdb26')
sha256sums_aarch64=('d27ab50b3562f5dfaf80f4293ec384f7f45a0c924bdf42d94e45ef88ec9cd2aa')


package() {
    cd "${pkgdir}" || exit

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
