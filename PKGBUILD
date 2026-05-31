# Maintainer: atvknox <atvknox at gmail dot com>

pkgname=blackarch-wallpapers-git
pkgver=80
pkgrel=2
pkgdesc="Official BlackArch Linux wallpapers"
arch=('any')
url="https://github.com/BlackArch/blackarch-artwork"
license=('custom')
install=blackarch-wallpapers-git.install

makedepends=('git')

source=("git+https://github.com/BlackArch/blackarch-artwork.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/blackarch-artwork"
    git rev-list --count HEAD
}

package() {
    install -d "$pkgdir/usr/share/backgrounds/blackarch"
    cp -r "$srcdir/blackarch-artwork/wallpaper/." \
        "$pkgdir/usr/share/backgrounds/blackarch/"
}
