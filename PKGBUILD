# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=26.11.3
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/homer-dashboard/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('bcdc33205bda0eeaf6bc404467757e4a64b6c7984617b2f05cf9323e17d5338ce4930abee2c4b12a7f6d553d4bd63d3747d8de5d5f196c0a5fa91c721d9ce508')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
