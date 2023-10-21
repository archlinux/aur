# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=23.10.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache')
_source_archive="${url}/releases/download/v${pkgver}/${_pkgname}.zip"
source=("${_source_archive}")
noextract=("${_source_archive}")
b2sums=('17f0f2cb11b16c7f0a191309673e87d645e3884932b959e0452f56b00bb9c7d0a5be6dd7d620ba3d955c65e906723defee16ba8f4f65794a204dd5bfbe956353')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "$(basename ${_source_archive})" --directory "${pkgdir}${_dest_dir}"
}
