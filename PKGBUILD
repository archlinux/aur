# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=r-sha3sum
pkgver=1.0.0
pkgrel=1
pkgdesc="sha3 cli (build using Rust): Print or check SHA3 digests. Commands and options are similar to the GNU Linux command shaXXXsum."
url="https://gitlab.com/kurdy/sha3sum"
license=('GPL-3.0-or-later')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/kurdy/sha3sum/-/archive/V1.0.0/sha3sum-V1.0.0.tar.gz")
sha256sums=('9ac68db84441c628cb6e2149513431c939a1ca2ce22f3512e5bbc4c697faf85f')
arch=('any')
_srcpath='kurdy-sha3sum-6de72ad187a8'
makedepends=('rust')
checkdepends=()
provides=('sha3sum')
conflicts=('sha3sum')

check() {
    cd "${_srcpath}"
    cargo test --release --locked --target-dir=target
}

build() {
   return 0
}

package() {
   cd "${_srcpath}"
   cargo install --no-track --locked --root "$pkgdir/usr/" --path .
}
