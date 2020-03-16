# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="mcmojave-circle-icon-theme"
_pkgname="McMojave-circle"
pkgver="2019.09.23"
pkgrel="2"
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops."
arch=('any')
url="https://github.com/vinceliuice/${_pkgname}"
license=('GPL3')
depends=('gtk-update-icon-cache')
optdepends=('mojave-gtk-theme: Recommended GTK theme.')
options=('!strip')
conflicts=("${pkgname}"-git)

source=("${_pkgname}-${pkgver//./-}.tar.gz::${url}/archive/${pkgver//./-}.tar.gz")
sha256sums=('d6ef6ba646f9735629ebdf7c31cb15f0d7ee0ddb60f7346436249bb48d7b6e44')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver//./-}"
    install -m755 -d "${pkgdir}/usr/share/icons"
    ./install.sh  \
        --all \
        --dest "${pkgdir}/usr/share/icons"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
