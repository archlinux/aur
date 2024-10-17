# Maintainer: Timo Crabbé <timocrabbe@gmail.com>
pkgname=beidconnect
pkgver=2.10.8.gb44810e
pkgrel=1
pkgdesc="native messaging component for DSS signing services"
arch=('x86_64')
url="https://github.com/Fedict/fts-beidconnect"
license=('MIT')
#depends=('libpcsclite')  # Specify dependencies required at runtime
makedepends=('git' 'gcc' 'make' 'pkg-config')  # Build-time dependencies
source=("git+https://github.com/Fedict/fts-beidconnect.git")
install=beidconnect.install  # Link to the install script
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/fts-beidconnect"  # Navigate to the repository directory
    git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/fts-beidconnect/linux"  # Navigate to the repository directory
    make
}

package() {
    cd "$srcdir/fts-beidconnect/linux"  # Navigate to the repository directory
    make DESTDIR="$pkgdir" install
}

clean() {
    cd "$srcdir/fts-beidconnect/linux"  # Navigate to the repository directory
    make clean
}
