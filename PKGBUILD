# Maintainer: Pace Willisson <pace@alum.mit.edu>
pkgname=unfatarians-studio
_tag=6b0e65d7eea42eeb61fc2424b77f793d4d2dd9bb
pkgver=5
pkgrel=1
pkgdesc="dockerized ardour6 with a rich set of plugins"
arch=('any')
url="https://codeberg.org/pacew/unfatarians-studio"
license=('GPL')
depends=('docker' 'pipewire')
source=("git+https://codeberg.org/pacew/unfatarians-studio.git")
md5sums=('SKIP')

prepare() {
    cd $pkgname
    git checkout --quiet $_tag
}

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir/" install
}

# git clean -fdx
