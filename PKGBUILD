# Maintainer: printwithbrackets <your@email.com>
pkgname=addpath-git
pkgver=0.0.0
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

source=("${_pkgname}::git+https://github.com/printwithbrackets/addpath.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 addpath.py "$pkgdir/usr/bin/addpath"
    install -Dm644 addpath.1  "$pkgdir/usr/share/man/man1/addpath.1"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
