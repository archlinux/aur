# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
pkgver=2.1
pkgrel=1
pkgdesc="A C-based seccomp analysis tool"
arch=(x86_64)
url="https://github.com/dbgbgtf1/Ceccomp"
license=('GPL-3.0-or-later')
depends=(
    libseccomp
    glibc
)
makedepends=(git)

source=("$pkgname"::git+https://github.com/dbgbgtf1/Ceccomp.git#tag=v${pkgver}?signed)
b2sums=('f47b7e8208f8a25e26c6282abec89e04d35d149a8ed75c0cb1e2b084804ce6b3a5e2c4d1a91aaf2abf75a2bec494535defa4670e3a96ac7369fa844b10cbbb34')

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
