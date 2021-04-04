# Maintainer Willy Reinhardt <dev@kurdy.ch>

pkgname=r-sha3sum
pkgver=0.1.5
pkgrel=1
pkgdesc="sha3 cli (buid using Rust): Print or check SHA3 digests. Commands and options are similar to the GNU Linux command shaXXXsum."
url="https://bitbucket.org/kurdy/sha3sum/src/master/"
license=('GPL-3.0-or-later')
source=("${pkgname}-v${pkgver}.tar.gz::https://bitbucket.org/kurdy/sha3sum/get/AUR_v0.1.5.tar.gz")
sha256sums=('f416534dfd0add02c7f2be44e40e6da6bfd5ae9727db0a95b5172fe93fa26901')
arch=('any')
_srcpath='kurdy-sha3sum-6de72ad187a8'
makedepends=('cargo')
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
