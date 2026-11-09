# Maintainer: yunmikun2 <yunmikun2@protonmail.com>
pkgname="fun-overlay-git"
_gitname=fun_overlay
pkgver=0.1.0.r2.2bfddf4
pkgrel=1
pkgdesc="A lightweight, draggable animated GIF overlay for Wayland compositors like Hyprland"
arch=('x86_64')
url="https://github.com/yunmikun2/fun_overlay"
license=('None')
depends=('python' 'python-gobject' 'python-pillow' 'gtk-layer-shell')
makedepends=('git')
provides=('fun-overlay')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo 0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  install -D -m755 ./main.py "$pkgdir/usr/bin/fun-overlay"
}
