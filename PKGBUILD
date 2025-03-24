# Maintainer: Vojtěch Sajdl <vojtech@sajdl.com>
# Contributor: liolok <aur@liolok.com>
_name="middleclickclose"
_uuid="middleclickclose@paolo.tranquilli.gmail.com"

pkgname="gnome-shell-extension-${_name}"
pkgver=32
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d7e377dd1927c7f7328f15160d17459924ad663fc8f1a37ffd1ada110263144')
conflicts=('gnome-shell-extension-middleclickclose-git')

package() {
    local _source="${srcdir}/${_name}-${pkgver}/src"
    local _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    mkdir --parents "${_target}"
    cp --archive --recursive "${_source}/"* "${_target}"
    glib-compile-schemas "${_target}/schemas/"
}
