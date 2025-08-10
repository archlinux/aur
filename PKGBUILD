# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=25.08.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache-2.0')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
noextract=("${_pkgname}-${pkgver}.zip")
b2sums=('46f1a9c588ea09faffaed3c6fb27008a76754a345fd589c8b139a956632cae1e9b7bcc1e9263214698e51ada185488f72e61bb7c7492576a4e87c15c32f1174b')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${pkgdir}${_dest_dir}"
}
