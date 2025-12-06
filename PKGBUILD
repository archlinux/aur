# Maintainer: Epdfjasfvzp <Epdfjasfvzp@zdsfa.com>
pkgname=focus-stack-git
_pkgname=focus-stack
pkgver=1.3.r33.gd8532c8
pkgrel=1
pkgdesc='Fast and easy focus stacking'
arch=('x86_64')
url='https://github.com/PetteriAimonen/focus-stack'
license=('MIT')
depends=('opencv')
makedepends=('git' 'sed' 'gcc')
source=('git+https://github.com/PetteriAimonen/focus-stack.git')
conflicts=('focus-stack')
provides=('focus-stack')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/focus-stack "$pkgdir/usr/bin/focus-stack"
    install -Dm644 docs/focus-stack.1 "$pkgdir/usr/share/man/man1/focus-stack.1.gz"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
