# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.5.5.r37.g488cb0f
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
source=($_gitpkgname::git+https://gitlab.com/divinae/${_gitpkgname}#commit=488cb0f024acd1fb592b200c61ffc2c25f888360)
b2sums=('0c82de3ff9bdcf247d4b97be7231b3f48a042618ef55ee5d3c47aaf1edf0438abeda3a278389a2c4af6eaa48b0cccf34c90888e6a379ce66ed3aa0e40c9eaf5e')

pkgver() {
    cd $_gitpkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
}
