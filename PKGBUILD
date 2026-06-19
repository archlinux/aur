# Maintainer: RoCHH <isvlad404  at  gmail dot com>

pkgname=ttf-fast-font-git
pkgver=0.0.2
pkgrel=3
pkgdesc="Fast-Font (VCS): font with OpenType feature to highlight first letters of words (built from Git)"
url="https://github.com/Born2Root/Fast-Font"
license=('MIT')
arch=('any')
makedepends=('git')
source=("git+https://github.com/Born2Root/Fast-Font.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Fast-Font"
    local _count=$(git rev-list --count HEAD)
    local _short=$(git rev-parse --short HEAD)
    echo "r${_count}.${_short}"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/fast-font"
     cp -a "${srcdir}/Fast-Font/fast-fonts/"*.ttf "${pkgdir}/usr/share/fonts/fast-font/"
}
