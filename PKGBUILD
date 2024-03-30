# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.5.5.r13.g09d8e4b
pkgrel=1
pkgdesc="A simple pomodoro KDE plasmoid"
arch=(any)
url="https://gitlab.com/divinae/focus-plasmoid"
license=(GPL-3.0-only)
depends=(
    libplasma
    plasma5support
    plasma-workspace
    python-gobject
    qt6-multimedia
)
makedepends=(git)
conflicts=(
    $_oldpkgname
    plasma5-applets-fokus
)
replaces=($_oldpkgname)
source=($_gitpkgname::git+https://gitlab.com/divinae/${_gitpkgname}#commit=09d8e4b73eff15ab42c79149cead255c191c72a5)
b2sums=(a6eb87eeb38a73791d510e07ca00052043782c71e2e19b6f98e179a9993927342ad3e1528a29a9944b60b8c63a07c22cd3b458a539d8cc855d1bdf65d5c16268)

pkgver() {
    cd $_gitpkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
}
