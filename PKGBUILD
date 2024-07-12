# Maintainer: Alad <devnull@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

# This wallpaper collection is complementary to the
# Shimmer Project Xfce themes

pkgname=shimmer-wallpapers
_pkgname=Wallpapers
pkgver=r1.ba134cb
pkgrel=1
epoch=1
pkgdesc="Complementary wallpaper collection for the Shimmer Project Xfce themes"
arch=("any")
url=http://shimmerproject.org
license=(CCPL:by-sa-3.0)
replaces=("shimmer-wallpapers-git")
conflicts=("shimmer-wallpapers-git")
provides=("shimmer-wallpapers-git" "shimmer-wallpapers")
makedepends=("git")
optdepends=("elementary-xfce-icons: matching icon set, -git or stable"
            "xfce-theme-bluebird: matching Shimmer Project Xfce theme, -git or stable"
            "xfce-theme-greybird: matching Shimmer Project Xfce theme, -git or stable")
source=("$pkgname::git+https://github.com/shimmerproject/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/backgrounds/xfce/"

    cp "$pkgname/Albatross"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
    cp "$pkgname/Bluebird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
    cp "$pkgname/Greybird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
}
