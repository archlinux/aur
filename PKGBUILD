# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=1.3
pkgrel=5
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

b2sums=('43ed7e9263d30388925b2e7fe38c5ee433f514cb6b9ddc41ea0e154b4e865eedc1cfac8b488a4180c619b9297ac26ee55f4cd7676fb37d52b0552d204e12e808')

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
