# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=dwm-baitinq-git
pkgbase=dwm-baitinq
pkgver=1
pkgrel=1
pkgdesc='Simple window manager (baitinq version)'
url='https://github.com/Baitinq/dwm.git'
arch=('any')
license=('GPL')
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

# include config.h and any patches you want to have applied here
source=('git://github.com/Baitinq/dwm.git')
sha256sums=('SKIP')


pkgver() {
    cd "$pkgbase"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgbase"
    make
}

package() {
    cd "$pkgbase"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
