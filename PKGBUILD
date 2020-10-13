# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="mcmojave-circle-icon-theme"
_pkgname="McMojave-circle"
pkgver="2020.10.11"
pkgrel="1"
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops."
arch=('any')
url="https://github.com/vinceliuice/${_pkgname}"
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme' 'numix-circle-icon-theme')
optdepends=('mojave-gtk-theme: Recommended GTK theme.')
options=('!strip')

source=("${_pkgname}-${pkgver//./-}.tar.gz::${url}/archive/${pkgver//./-}.tar.gz")
sha256sums=('4a7e2b18de2b860873fa66533c17f487ab451e650a668dad6919b5cc6f8cdf72')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver//./-}"
    install -m755 -d "${pkgdir}/usr/share/icons"
    ./install.sh  \
        --all \
        --circle \
        --dest "${pkgdir}/usr/share/icons"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
