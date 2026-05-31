# Maintainer: atvknox <atvknox at gmail dot com>

pkgname=blackarch-wallpapers-git
pkgver=1.r0.g0000000
pkgrel=1
pkgdesc="Official BlackArch Linux wallpapers (git version)"
arch=('any')
url="https://github.com/BlackArch/blackarch-artwork"
license=('custom')

makedepends=('git')

source=("git+https://github.com/BlackArch/blackarch-artwork.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/blackarch-artwork"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/blackarch-artwork"

    install -d "$pkgdir/usr/share/backgrounds/blackarch"

    # copy ONLY wallpapers but from full repo checkout
    cp -r wallpaper/. \
        "$pkgdir/usr/share/backgrounds/blackarch/"
}
