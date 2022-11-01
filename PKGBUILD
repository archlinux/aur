# Maintainer: Heinrich Kießling <heinrich@kiess.link>
pkgname=gnome-shell-extension-syspeek-gs-git
_pkgname=syspeek-gs

pkgver=r17.1d33ea5
pkgrel=1
pkgdesc="A simple CPU monitor for Gnome Shell inspired by SysPeek indicator"
arch=('any')
url="https://github.com/eugene-rom/syspeek-gs"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/eugene-rom/syspeek-gs")
_buildfolder="build/syspeek-gs@gs.eros2.info"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
    cp -r "$_buildfolder" "$pkgdir/usr/share/gnome-shell/extensions/"
}
