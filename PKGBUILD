# Maintainer: Louis Dalibard <ontake (at) ontake (dot) dev>
pkgname=plasma6-applets-optimus-gpu-switcher-git
_gitpkgname=optimus-gpu-switcher
pkgver=r138.a298529
pkgrel=1
pkgdesc="KDE Plasma widget to change the GPU mode using the EnvyControl command line tool."
arch=(any)
url=https://github.com/enielrodriguez/optimus-gpu-switcher
license=(GPL-3.0-only)
depends=(
    kdeplasma-addons
    libplasma
    plasma5support
    envycontrol
)
makedepends=(git)
optdepends=(
    'libnotify: notification support'
    'zenity: support for displaying GTK dialog boxes'
)
conflicts=()
source=($_gitpkgname::git+https://github.com/enielrodriguez/$_gitpkgname)
b2sums=(SKIP)

pkgver() {
    cd $_gitpkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitpkgname
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/
    kpackagetool6 -t Plasma/Applet -i ./ -p "$pkgdir"/usr/share/plasma/plasmoids/
}
