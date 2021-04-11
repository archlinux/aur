# Maintainer: liolok <aur@liolok.com>

_name="middleclickclose"
_uuid="middleclickclose@paolo.tranquilli.gmail.com"

pkgname="gnome-shell-extension-${_name}"
pkgver=1.5
pkgrel=1
epoch=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f3f25c3b7bb02570f7ff270598cbfde3e01cc892af39f717a93853cc3fc54d97')

package() {
    local _source="${_name}-${pkgver}/${_uuid}"
    local _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    mkdir --parents ${_target}
    cp --archive --recursive ${_source}/* --target-directory=${_target}
    glib-compile-schemas ${_target}/schemas
}
