# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=plasma6-applets-wallhaven-reborn-git
_pkgname=${pkgname%-git}
pkgver=r67.030bbfe
pkgrel=2
pkgdesc="Wallhaven wallpaper plugin for plasma 6"
arch=(any)
url="https://github.com/Blacksuan19/plasma-wallpaper-wallhaven-reborn"
license=(GPL-3.0-only)
depends=(plasma-workspace)
makedepends=(kpackage git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_pkgname}"
  kpackagetool6 --type Plasma/Wallpaper --install package/ --packageroot "${pkgdir}/usr/share/plasma/wallpapers/"
}
