# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=r-sha3sum
pkgver=1.0.1
pkgrel=1
pkgdesc="sha3 cli (build using Rust): Print or check SHA3 digests. Commands and options are similar to the GNU Linux command shaXXXsum."
url="https://gitlab.com/kurdy/sha3sum"
license=('GPL-3.0-or-later')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/kurdy/sha3sum/-/archive/V1.0.1/sha3sum-V1.0.1.tar.gz")
sha256sums=('b9d3cfc41f33c73e8b2854bef5a285403952f45d562183e29bb0f37fcd7f31cf')
arch=('any')
_srcpath='sha3sum-V1.0.1'
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
