# Maintainer:
# Contributor: Jan Trejbal <jan.trejbal@gmail.com>

pkgname=gnome-shell-extension-docker-integration-git
_gitname=gnome-docker-integration
pkgver=r17.1f90240
pkgrel=1
pkgdesc="Base Docker&Docker compose integration (start, stop, log, up), hide Docker network (veth*)"
arch=('any')
url="https://github.com/Trejjam/Gnome-Docker-integration"
license=('GPL-3.0-or-later')
depends=('gnome-shell' 'networkmanager')
makedepends=('git')
provides=("docker-integration-applet")
source=("${_gitname}::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd $_gitname
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "src" "$pkgdir/usr/share/gnome-shell/extensions/docker-integration@jan.trejbal.gmail.com"
}
