# Maintainer: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-dark-gtk
_pkgname=Aritim-Dark
pkgver=r74.9306a29
pkgrel=1
pkgdesc="A Dark theme for GTK based DEs, deeply inspired by the Ayu Dark color palette."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

shopt -s extglob

package_aritim-dark-gtk() {
    provides=('aritim-dark-gtk')
    optdepends=('aritim-dark-kde: Matching KDE theme')

    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/themes/Aritim-Dark"

    cp -r GTK/* ${pkgdir}/usr/share/themes/Aritim-Dark
}
