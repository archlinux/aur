# Maintainer: Lev Levitsky <levlev at mail.ru>
_name=ScanHeadsman
_name_lc=$(echo "${_name}" | tr '[:upper:]' '[:lower:]')
pkgname="${_name_lc}-bin"
provides=("${_name_lc}")
conflicts=("${_name_lc}")
pkgver=1.4.20260310
pkgrel=1
epoch=
pkgdesc="A tool to extract scan data and methods from Thermo RAW file into a text-based format"
arch=('any')
url="https://bitbucket.org/caetera/scanheadsman"
license=('MIT')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
makedepends=('unzip')
options=('!strip')
source=("${url}/downloads/${_name}-${pkgver}.zip"
        "${_name}")
noextract=("${_name}-${pkgver}.zip")
md5sums=('2f90263dd1f9000a6b08098a3e0d594a'
         '6160a546e635d36a2234825c579df33d')

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
