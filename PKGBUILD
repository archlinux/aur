# Maintainer: liolok <aur@liolok.com>

_name="middleclickclose"
_uuid="middleclickclose@paolo.tranquilli.gmail.com"

pkgname="gnome-shell-extension-${_name}"
pkgver=1.7
pkgrel=1
epoch=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dd7b3cb6e5b8add28c08f7395754be23e1d6b2a67196dbbf25eb09a83c0ee463')

package() {
    local _source="${_name}-${pkgver}/${_uuid}"
    local _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    mkdir --parents ${_target}
    cp --archive --recursive ${_source}/* --target-directory=${_target}
    glib-compile-schemas ${_target}/schemas
}
