# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.1#2'
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
sha256sums=('c42484b9ede8a70acf886086cf388511b202c0d37543731e20ce215d29f846db')

package() {
    mkdir "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    cp -pr "$srcdir/Picat" "$pkgdir/opt"
    ln -s "/opt/Picat/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
