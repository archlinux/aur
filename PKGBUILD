# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.3.0
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('any')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL3')
depends=('cppad')
optdepends=('eigen: required when DAE differentiation index reduction is used',
            'valgrind: memcheck test'
            'clang: only required for JIT compilation'
            'llvm: only required for JIT compilation')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('4e539a19b2cee0401605217b5b7e586b306c5008')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
