# Maintainer: Lev Levitsky <levlev at mail.ru>
_name=ScanHeadsman
_name_lc=$(echo "${_name}" | tr '[:upper:]' '[:lower:]')
pkgname="${_name_lc}-bin"
pkgver=1.2.20200604
pkgrel=2
epoch=
pkgdesc="A tool to extract scan data and methods from Thermo RAW file into a text-based format"
arch=('any')
url="https://bitbucket.org/caetera/scanheadsman"
license=('MIT')
depends=('mono')
options=('!strip')
source=("${url}/downloads/${_name}-${pkgver}.zip"
        "${_name}")
noextract=("${_name}-${pkgver}.zip")
md5sums=('3af5d526b024f6f2953d0dcd344f9e1e'
         '1bff258fa44eb24eb939e8fbddd5c45d')

prepare() {
    mkdir -pv "${srcdir}/${_name}-${pkgver}"
    unzip -d "${_name}-${pkgver}" "${_name}-${pkgver}.zip"
}
package() {
    mkdir -pv "${pkgdir}/usr/share/${_name}"
    mkdir -pv "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${_name}-${pkgver}/"* "${pkgdir}/usr/share/${_name}/"
    install -t "${pkgdir}/usr/bin" "${_name}"
}
