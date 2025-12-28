# Maintainer: Yang Mingtian <i@skylee.xyz>
pkgname=z3_tptp
pkgver=4.15.4
pkgrel=1
pkgdesc='TPTP front-end for the Z3 theorem prover'
arch=('x86_64')
url='https://z3prover.github.io/'
license=('MIT')
source=("https://github.com/Z3Prover/z3/archive/refs/tags/z3-${pkgver}.tar.gz")
sha256sums=('dae526252cb0585c8c863292ebec84cace4901a014b190a73f14087dd08d252b')

depends=('z3')
makedepends=('gcc')

build() {
    cd "z3-z3-${pkgver}"
    g++ -I./src/api/c++ -I./src/api -std=c++11 -o z3_tptp examples/tptp/tptp5.cpp examples/tptp/tptp5.lex.cpp -lz3
}

package() {
	install -D "z3-z3-${pkgver}/z3_tptp" -t "${pkgdir}/usr/bin/"
}
