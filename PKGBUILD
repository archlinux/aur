# Maintainer: Supreme <criteria32 at gmail dot com>
pkgname='mspdebug-git'
pkgrel=1
pkgver=v0.25.r76.ga1a06e7
pkgdesc="Free debugger for MSP430 MCUs"
arch=('x86_64')
url="https://github.com/dlbeer/mspdebug"
license=('GPL')
depends=('libusb-compat' 'readline')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/dlbeer/mspdebug.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}
build(){
    cd "$srcdir/${pkgname%-git}"
    make
}
package(){
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
