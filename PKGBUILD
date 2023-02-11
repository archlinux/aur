# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=r-sha3sum
pkgver=1.2.2
pkgrel=1
pkgdesc="sha3 cli (build using Rust): Print or check SHA3 digests. Commands and options are similar to the GNU Linux command shaXXXsum."
url="https://gitlab.com/kurdy/sha3sum"
license=('GPL-3.0-or-later')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/kurdy/sha3sum/-/archive/v1.2.2/sha3sum-v1.2.2.tar.gz")
sha256sums=('2e2c5f61f3a2478f1af11e70bf3f8fd136b12f3e5a328df2591bcdb43f0907fd')
arch=('any')
_srcpath='sha3sum-v1.2.2'
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
