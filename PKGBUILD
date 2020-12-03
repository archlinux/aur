# Maintainer: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-light-gtk
_pkgname=Aritim-Light
pkgver=r41.89a25fe
pkgrel=1
pkgdesc="A Light theme for GTK, pleasant to the eyes and perfect for your daily workload."
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

package_aritim-light-gtk() {
    provides=('aritim-light-gtk')
    optdepends=('aritim-light-kde: Matching KDE theme')

    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/themes/Aritim-Light"

    cp -r GTK/* ${pkgdir}/usr/share/themes/Aritim-Light
}
