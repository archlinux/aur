# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=wal-git
_pkgname=wal
pkgver=r194.7e9917a
pkgrel=1
pkgdesc="Generate and change colorschemes on the fly."
arch=('any')
url="https://github.com/dylanaraps/wal"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
    'bash'
    'imagemagick'
)
optdepends=(
    'bgs: Set wallpaper.'
    'feh: Set wallpaper.'
    'habak: Set wallpaper.'
    'hsetroot: Set wallpaper.'
    'nitrogen: Set wallpaper.'
    'xorg-xprop: Used to detect which DE Wallpaper setter to use.'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/wal.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ./wal "${pkgdir}/usr/bin/$_pkgname"
}
