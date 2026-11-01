# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>

pkgname=ucsim
pkgver=0.9.12
pkgrel=1
pkgdesc="Software simulator for microcontrollers"
arch=('x86_64' 'aarch64')
url="http://mazsola.iit.uni-miskolc.hu/~drdani/embedded/ucsim/"
license=('GPL-2.0-or-later')
depends=('libgcc' 'ncurses' 'libstdc++' 'glibc')
makedepends=('git' 'flex' 'bison' 'gcc' 'make')

source=("git+https://github.com/danieldrotos/${pkgname}.git#tag=${pkgname}-${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    ./configure --prefix="/usr"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}

