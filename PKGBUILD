# Maintainer: CaptainKnots <captainknots@riseup.net>
#
# Contributor: CaptainKnots <captainknots@riseup.net>
#
pkgname="mcmojave-circle-icon-theme"
_pkgname="McMojave-circle"
pkgver="2022.07.03"
pkgrel="1"
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops."
arch=('any')
url="https://github.com/vinceliuice/${_pkgname}"
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme' 'numix-circle-icon-theme')
optdepends=('mojave-gtk-theme: Recommended GTK theme.')
options=('!strip')

source=("${_pkgname}-${pkgver//./-}.tar.gz::${url}/archive/${pkgver//./-}.tar.gz")
sha256sums=('08002818036252fefdecac97bf340d7e8f4dde39ce05641f4f95c7aff72dbd3b')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver//./-}"
    install -m755 -d "${pkgdir}/usr/share/icons"
    ./install.sh  \
        --all \
        --circle \
        --dest "${pkgdir}/usr/share/icons"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
