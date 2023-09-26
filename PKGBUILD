# Maintainer: bgh <aur at bgh dot io>

_pkgname=homer
pkgname="${_pkgname}-web"
pkgver=23.09.1
pkgrel=1
pkgdesc='A very simple static homepage for your server'
arch=('any')
url="https://github.com/bastienwirtz/${_pkgname}"
license=('Apache')
_source_archive="${url}/releases/download/v${pkgver}/${_pkgname}.zip"
source=("${_source_archive}")
noextract=("${_source_archive}")
b2sums=('6873105c609ccfcabefcf9a5ef236505c5f80808363202284e0ec5a8c5c24d393242475691c6949241847d7f07968b23309df5b9d31ccd6c27fb03238a6d9c19')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    bsdtar --extract --file "$(basename ${_source_archive})" --directory "${pkgdir}${_dest_dir}"
}
