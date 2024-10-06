# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
pkgname=where-is-my-sddm-theme-git
_pkgname=${pkgname%-git}
epoch=1
pkgver=r105.9637154
pkgrel=1
pkgdesc='The most minimalistic SDDM theme among all themes.'
arch=("any")
url="https://github.com/stepanzubkov/where-is-my-sddm-theme"
license=("MIT")
depends=("qt6-5compat" "qt6-declarative" "sddm")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"

    mkdir -p $pkgdir/usr/share/sddm/themes
    cp -r where_is_my_sddm_theme $pkgdir/usr/share/sddm/themes/

    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
