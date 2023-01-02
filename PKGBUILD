# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=r-sha3sum
pkgver=1.2.0
pkgrel=1
pkgdesc="sha3 cli (build using Rust): Print or check SHA3 digests. Commands and options are similar to the GNU Linux command shaXXXsum."
url="https://gitlab.com/kurdy/sha3sum"
license=('GPL-3.0-or-later')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/kurdy/sha3sum/-/archive/v1.2.0/sha3sum-v1.2.0.tar.gz")
sha256sums=('72f859efa351fbfefd6f2ff0cfdce7170e32e81a240e7d47fc82a6733b251cff')
arch=('any')
_srcpath='sha3sum-v1.2.0'
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
