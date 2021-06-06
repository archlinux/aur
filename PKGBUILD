# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-dark-gtk-git
_pkgname=Aritim-Dark
pkgver=r108.a908770
pkgrel=1
pkgdesc="A Dark theme for GTK based DEs, deeply inspired by the Ayu Dark color palette."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
provides=('aritim-dark-gtk')
optdepends=('aritim-dark-kde: Matching KDE theme')
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

    mkdir -p "${pkgdir}/usr/share/themes/Aritim-Dark"
    cp -r GTK/* ${pkgdir}/usr/share/themes/Aritim-Dark
}
