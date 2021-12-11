# Maintainer: Collin Diekvoss <cdiekvoss@gmail.com>
pkgname=plasma-desktop-run-command
_pkgname=run-command
pkgver=1.1
pkgrel=1
pkgdesc="See the project's homepage for more information"
arch=('x86_64')
url="https://github.com/wsdfhjxc/run-command"
license=('GPL3')
depends=('plasma-framework')
makedepends=('gcc' 'cmake' 'extra-cmake-modules')
provides=("plasma-desktop-run-command")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wsdfhjxc/run-command/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e5a143df53864487f67b391e85012cd75f43e1a13d832cc118ba2948a14fb53')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/build"

    install -Dm644 plasma_containmentactions_runcommand.so "${pkgdir}/usr/lib/qt/plugins/plasma/containmentactions/plasma_containmentactions_runcommand.so"
}
