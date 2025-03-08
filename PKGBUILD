# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=25.03.2
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('1453e43d8776941804e361743eba5cb0bc535bf2795e4f43ce63c47cbaa2f477e6f8eb2af17a1294338e9d6cb8d541e8ac45ddb22bdcb46e599a20bd6c4deef3')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
