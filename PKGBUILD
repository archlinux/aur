# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=24.11.5
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('1585ff6dba2f607e90600c280deb7dc3cd887c6c65ee9afacb55887c1b93083200347c1e811c594319b21879eea812faad7592543655bc88d6f6dca809ab5820')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
