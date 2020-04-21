# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='2.8#5'
pkgrel=1
pkgdesc='A simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications.'
arch=('x86_64')
groups=()
depends=(glibc)
optdepends=('coin-or-cbc: CBC MIP support'
            'glpk: GLPK MIP support'
            'gurobi: Gurobi MIP support'
            'z3: SMT support')
url='http://picat-lang.org/'
license=('MPL')

_pkgver=$(echo ${pkgver} | sed 's/\.//;s/#/_/')
source=("http://picat-lang.org/download/${pkgname}${_pkgver}_linux64.tar.gz")
sha256sums=('9c0587d6230361e5bfe13e31b48c0aaddb46e5d031d33b2b4c4139448d3d1cb1')

package() {
    mkdir "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    cp -pr "$srcdir/Picat" "$pkgdir/opt"
    ln -s "/opt/Picat/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
