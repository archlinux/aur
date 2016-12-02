# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=openicc-basiccolor-offset-profiles
pkgver=2009
pkgrel=1
pkgdesc='Extra ICC profiles'
url="https://www.freedesktop.org/wiki/OpenIcc/ProfilePackages/"
arch=('any')
depends=('openicc')
source=("http://www.colormanagement.org/download_files/basICColor_Offset_${pkgver}.zip")
license=('GPL')
sha256sums=('0b02a0c1c302407c72b2b76dfd8537ea9bfde9fa0ff2c2df2e3ad94340d69830')

package() {
    cd "basICColor_Offset_${pkgver}"
    for _i in $(find . -name '*.ICC' -type f); do install -Dm644 "${_i}" "${pkgdir}/usr/share/color/icc/OpenICC/${_i}"; done
    for _i in $(find . -name '*.pdf' -type f); do install -Dm644 "${_i}" "${pkgdir}/usr/share/doc/${pkgname}/${_i}"; done
}

