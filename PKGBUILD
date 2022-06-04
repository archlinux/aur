# Maintainer: Pace Willisson <pace@alum.mit.edu>
pkgname=unfatarians-studio
_tag=1ff62b2e2fc83d9102263f7b16e3217496142a1a
pkgver=1
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
