# Maintainer: liolok <aur@liolok.com>

_name="middleclickclose"
_uuid="middleclickclose@paolo.tranquilli.gmail.com"

pkgname="gnome-shell-extension-${_name}"
pkgver=1.8.1
pkgrel=1
epoch=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('00e2fd0c2cef95a0924bd32a5a75c95347425a4bf383f4fc2132c301be9a3aa2')

package() {
    local _source="${_name}-${pkgver}/${_uuid}"
    local _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    mkdir --parents ${_target}
    cp --archive --recursive ${_source}/* --target-directory=${_target}
    glib-compile-schemas ${_target}/schemas
}
