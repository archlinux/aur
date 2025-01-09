# Maintainer: Yixuan <yxz@yxz.is-a.dev>

_pkgname=hypr-window-picker
pkgname=${_pkgname}-git
pkgver=20250109.r6.f82f718
pkgrel=1
pkgdesc='Simple middleware for hyprland-toplevel-export-v1'
url='https://github.com/yz9551/hypr-window-picker'
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('wayland')
package=('hyprland')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/yz9551/hypr-window-picker')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci main | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $_pkgname/hypr-window-picker $pkgdir/usr/bin/hypr-window-picker
}

