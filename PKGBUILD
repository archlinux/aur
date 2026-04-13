# Maintainer: printwithbrackets <your@email.com>
pkgname=addpath-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Hunt down executables not in your PATH and fix it"
arch=('any')
url="https://github.com/printwithbrackets/addpath"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('addpath')
conflicts=('addpath')
_pkgname=addpath

source=("${_pkgname}::git+https://github.com/printwithbrackets/addpath.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 addpath.py "$pkgdir/usr/bin/addpath"
    install -Dm644 addpath.1  "$pkgdir/usr/share/man/man1/addpath.1"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
