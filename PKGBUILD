# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

_gitname=material-design-icons
pkgbase=material-icons-git
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=4.0.0.r13.g6ebe181c63
pkgrel=1
pkgdesc="Material design icons is the official icon set from Google."
url='https://github.com/google/material-design-icons'
arch=('any')
license=('Apache')
makedepends=('git')
provides=("otf-material-icons=${pkgver}" "ttf-material-icons=${pkgver}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_otf-material-icons-git() {
    cd "${_gitname}"
    install -Dm644 font/*.otf -t "$pkgdir"/usr/share/fonts/OTF
}

package_ttf-material-icons-git() {
    cd "${_gitname}"
    install -Dm644 font/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
