# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=1.5
pkgrel=2
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
b2sums=('483115d3186ec36d28416023dde8e893beade9136d834520cbb1ccba9e02a30b1fe842e41d180953347d51613b249ef265e416451ad5f8c84f3dfdba30a33dbd')

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
