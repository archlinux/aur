# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=3.2.0
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
source=($_gitpkgname::git+https://gitlab.com/divinae/${_gitpkgname}.git#tag=v$pkgver)
b2sums=('8c63c46f945d16884331a13385e1f2f9715ca696006194b94ea92c68721d86002eddd9e92fc280b5d03eabb4042d8190f4f23e493fae9a7fc395e2264fc272dc')

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
}
