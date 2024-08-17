# Maintainer: Cococry <cococry.btw@gmail.com>
# Contributor: Luxzi <luxzi@pm.me>

pkgname=ragnarwm
_pkgname="ragnar"
pkgver='2.0'
pkgrel=1
pkgdesc="Minimal, flexible & user-friendly X tiling window manager"
arch=('x86_64')
url="https://github.com/cococry/ragnar"
license=('GPL')
groups=()
depends=('xcb-util' 'xcb-proto' 'xcb-util-keysyms' 'xcb-util-cursor' 'xcb-util-wm' 'xorg-server' 'xorg-xinit' 'mesa' 'libconfig')
makedepends=('git' 'make' 'gcc')
provides=('ragnarwm')
source=("${_pkgname}::git+https://github.com/cococry/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo $pkgver
}

build() {
    cd $_pkgname
    cd api 
    make && sudo make install 
    cd ..
    make config
    make
}

package() {
    cd $_pkgname 
    sudo make install
}
