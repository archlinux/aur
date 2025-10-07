# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=25.10.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('35d4368e9d1ca75f5fb350ea1d7989d2fe4afa6ce95a6d5f5529ae2b030ae95b3f30cb866b7e5de32c1525c32256104e9d4c34f156b69805fab4e36e91cda725')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
