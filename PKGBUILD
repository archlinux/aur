# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=r-fsrs
pkgver=0.1.0
pkgrel=1
pkgdesc="R bindings for fsrs-rs spaced repetition algorithm (FSRS-6)"
arch=('x86_64')
url="https://github.com/chrislongros/r-fsrs"
license=('MIT')
depends=('r' 'rust')
makedepends=('git')
source=("git+https://github.com/chrislongros/r-fsrs.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/r-fsrs"
    R CMD INSTALL --build .
}

package() {
    cd "$srcdir/r-fsrs"
    install -dm755 "$pkgdir/usr/lib/R/library"
    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" .
}
