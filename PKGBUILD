# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=23.05.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache')
_source_archive="${url}/releases/download/v${pkgver}/${_pkgname}.zip"
source=("${_source_archive}")
noextract=("${_source_archive}")
sha384sums=('7e0906f5a897bb8b552380a02faea30b3caf07b5bdee5a33a6627a95c210d027f3c71e801f370442a89ba85d8da2ddfd')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "$(basename ${_source_archive})" --directory "${pkgdir}${_dest_dir}"
}
