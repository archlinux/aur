# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-light-gtk-git
_pkgname=Aritim-Light
pkgver=r68.19223ea
pkgrel=1
pkgdesc="A Light theme for GTK, pleasant to the eyes and perfect for your daily workload."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
provides=('aritim-light-gtk')
optdepends=('aritim-light-kde: Matching KDE theme')
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

package() {
    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/themes/Aritim-Light"
    cp -r GTK/* ${pkgdir}/usr/share/themes/Aritim-Light
}
