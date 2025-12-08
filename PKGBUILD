# Maintainer: Sameep Kathayat <sameepsk2@gmail.com>
pkgname=dax-shell
pkgver=1.0.0
pkgrel=1
pkgdesc="A custom Unix shell written in C++ with support for piping, redirection, history management, and built-in commands."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sameepkat/Dax"
license=('GPL3')
depends=('readline')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/sameepkat/Dax.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Dax"
    make
}

package() {
    cd "$srcdir/Dax"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
