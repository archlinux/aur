# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frame-x-server-git
pkgver=0.0.56.r90.g236e86b
pkgrel=1
pkgdesc='X11 display server for the CHasm desktop written in x86_64 assembly (git version)'
arch=('x86_64')
url='https://github.com/isene/frame/'
license=('Unlicense')
makedepends=(
    'git'
    'nasm')
provides=('frame-x-server')
conflicts=('frame-x-server')
source=('frame-x-server'::'git+https://github.com/isene/frame.git')
sha256sums=('SKIP')

pkgver() {
    git -C frame-x-server describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    make -C frame-x-server
}

package() {
    make -C frame-x-server DESTDIR="$pkgdir" PREFIX='/usr' install
}
