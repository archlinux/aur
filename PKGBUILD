# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=1.4
pkgrel=3
pkgdesc="A C-based seccomp analysis tool"
arch=(x86_64)
url="https://github.com/dbgbgtf1/Ceccomp"
license=('GPL-3.0-or-later')
depends=(
    libseccomp
    gcc-libs
    glibc
)
makedepends=(git)
source=("$pkgname"::git+https://github.com/dbgbgtf1/Ceccomp.git#tag=v${pkgver}?signed)

b2sums=('4f453e9a447fca9f190fe15594e540b752740ebfe6d065698538ce0c0fb73222f3ddf487f57fa7a5c2496c5bad0073e314aba68a04b2ef36e930e37f1b474900')

validpgpkeys=(
    '0816A179BB09248F30468BD6542A0969B5CEDCDB' # dbgbgtf1 <dudududumaxver@outlook.com>
    'A7ACCC386C15E3C554D34B3EAB08F98092A456BB' # RocketDev <ma2014119@outlook.com>
)

build() {
    cd "$srcdir/$pkgname"
    make ceccomp DEBUG=1
}

package() {
    cd "$srcdir/$pkgname"
    make install DEST_DIR="$pkgdir"
}
