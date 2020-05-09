# Maintainer: Lev Levitsky <levlev at mail.ru>
_name=ThermoRawFileParser
pkgname=$(echo "${_name}" | tr '[:upper:]' '[:lower:]')-bin
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="Thermo RAW file parser that runs on Linux with mono"
arch=('any')
url="https://github.com/compomics/ThermoRawFileParser"
license=('Apache')
depends=('mono')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/${_name}.zip"
        "${_name}")
noextract=("${_name}.zip")
md5sums=('8f100624942ca66c9fbaa5bfc03a9a48'
         '2d0b284fb357649ccc85e2774f48408e')

prepare() {
    mkdir -pv "${srcdir}/${_name}-${pkgver}"
    unzip -d "${_name}-${pkgver}" "${_name}.zip"
}
package() {
    mkdir -pv "${pkgdir}/usr/share/${_name}"
    mkdir -pv "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${_name}-${pkgver}/"* "${pkgdir}/usr/share/${_name}/"
    install -t "${pkgdir}/usr/bin" "${_name}"
}
