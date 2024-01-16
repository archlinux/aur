# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
pkgname=where-is-my-sddm-theme-git
_pkgname=${pkgname%-git}
pkgver=v1.6.0.r1.g159793c
pkgrel=1
pkgdesc='The most minimalistic SDDM theme among all themes.'
arch=("any")
url="https://github.com/stepanzubkov/where-is-my-sddm-theme"
license=("MIT")
depends=("qt5-graphicaleffects" "qt5-quickcontrols2" "sddm")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -Dm644 -t $pkgdir/usr/share/sddm/themes/where_is_my_sddm_theme where_is_my_sddm_theme/*
    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
