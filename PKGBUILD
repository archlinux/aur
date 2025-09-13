# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=3.0
pkgrel=1
pkgdesc="A C-based seccomp analysis tool"
arch=(x86_64)
url="https://github.com/dbgbgtf1/Ceccomp"
license=('GPL-3.0-or-later')
depends=(
    libseccomp
    glibc
)
makedepends=(
    asciidoctor # for doc generation
    python # for configure
    git
    util-linux # for flock to display a progress
)

source=("$pkgname"::git+https://github.com/dbgbgtf1/Ceccomp.git#tag=v${pkgver}?signed)
b2sums=('37666cd2c2dad947cc5fe6de90fe20675e040c3c5d8ddc71d10bb7eecc01095ad4f3428593ea717a7f8e58a4b3ebc98b05515d00f7c81aeb1bf614b107b81488')

validpgpkeys=(
    '0816A179BB09248F30468BD6542A0969B5CEDCDB' # dbgbgtf1 <dudududumaxver@outlook.com>
    'A7ACCC386C15E3C554D34B3EAB08F98092A456BB' # RocketDev <ma2014119@outlook.com>
)

prepare() {
    cd "$srcdir/$pkgname"
    ./configure --prefix="$pkgdir/usr"
    make clean
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make install
}
