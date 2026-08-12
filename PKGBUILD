# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=3.1.1
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
b2sums=('94f6d969646de57d1ddf8578b4e660dc4d0bd3cbacd2fae4d9ad409da104289e1d1cd8ea6c7c8501e5f0d7037ecaabb889bd714361e1150c8cd8f3da270829e4')

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/com.dv.fokus/
}
