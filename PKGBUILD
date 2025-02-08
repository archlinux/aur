# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=25.02.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('72de456f08db95bc2f83c7d9e04c9a8efc651ab7c18bac5c4a0fd734dd8889baf259f68c49b5226fcb0ad935888b2a7c24aaeb659356251053d831774e038eb1')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
