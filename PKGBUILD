# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=1.4
pkgrel=4
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

b2sums=('7334a3663a9926b13df7fc7fe82c8c326281680e6e94c1e8cbe69f13bd06d3cb090f0a357c3fcd9c7d58397d211ac06f25323316fc57d0155a2e17b3941f27eb')

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
