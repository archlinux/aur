# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-simpleweather-git
_gitpkgname=plasma-applet-simpleweather
pkgver=r131.d353056
pkgrel=1
pkgdesc="A minimalistic desktop weather widget based on the default KDE one"
arch=(any)
url=https://github.com/Zren/plasma-applet-simpleweather
license=(GPL-3.0-only)
depends=(
    kdeplasma-addons
    libplasma
    plasma5support
)
makedepends=(git)
conflicts=(plasma5-applets-simpleweather-git)
source=($_gitpkgname::git+https://github.com/Zren/$_gitpkgname)
b2sums=(SKIP)

pkgver() {
    cd $_gitpkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.github.zren.simpleweather
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.github.zren.simpleweather/
}
