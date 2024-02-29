# Maintainer: Collin Diekvoss <collin@diekvoss.com>
pkgname=plasma-desktop-run-command
pkgver=0.1
pkgrel=2
pkgdesc="See the project's homepage for more information"
arch=('x86_64')
url="https://github.com/rZn/run-command"
license=('GPL2')
depends=('plasma-framework')
makedepends=('gcc' 'cmake' 'extra-cmake-modules')
provides=("plasma-desktop-run-command")
source=("$pkgname-$pkgver.tar.gz::https://github.com/rZn/plasma-desktop-run-command/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1c94138280f338478415a8afa76bc977cce40e0f2f48eb4e87704d91a7746aaf')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"

    install -Dm644 plasma_containmentactions_runcommand.so "${pkgdir}/usr/lib/qt/plugins/plasma/containmentactions/plasma_containmentactions_runcommand.so"
}
