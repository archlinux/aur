# Maintainer: Vojtěch Sajdl <vojtech@sajdl.com>
_name="middleclickclose"
_uuid="middleclickclose@paolo.tranquilli.gmail.com"

pkgname="gnome-shell-extension-${_name}"
pkgver=31
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('281cb86e55bdcf63c9cae5442c1d9ed73a86ae2a1144efaf595c61e5658f4212')

package() {
    local _source="${_name}-${pkgver}/src"
    local _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    mkdir --parents ${_target}
    cp --archive --recursive ${_source}/* --target-directory=${_target}
    glib-compile-schemas ${_target}/schemas
}
