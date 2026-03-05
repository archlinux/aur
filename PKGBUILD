# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=2.3.3
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
source=($_gitpkgname::git+https://gitlab.com/divinae/${_gitpkgname}#tag=v$pkgver)
b2sums=('bd115ddffaba10b058e00b0b15c3acebe9d273bb99597af0375853e3f872fb89d4dda08c33e487cc050e26673f09c47bacbf45ed09b3f3b0609f335079b97bb3')

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
}
