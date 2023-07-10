# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.5'
pkgrel=1
pkgdesc='A simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications.'
arch=('x86_64')
groups=()
depends=(glibc)
optdepends=('coin-or-cbc: CBC MIP support'
            'cvc4: CVC4 SMT support'
            'glpk: GLPK MIP support'
            'gurobi: Gurobi MIP support'
            'z3: Z3 SMT support')
url='http://picat-lang.org/'
license=('MPL')

_pkgver=$(echo ${pkgver} | sed 's/\.//;s/#//')
source=("http://picat-lang.org/download/${pkgname}${_pkgver}_linux64.tar.gz")
sha256sums=('8e4380fba441fbc6675b63e071c4b2197eca44457be496c9efd8338e8932d030')

package() {
    mkdir "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    cp -pr "$srcdir/Picat" "$pkgdir/opt"
    ln -s "/opt/Picat/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
