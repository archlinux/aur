# Maintainer: Chris <your@email.com>
pkgname=r-fsrsr
pkgver=0.1.0
pkgrel=1
pkgdesc="R bindings for fsrs-rs spaced repetition algorithm (FSRS-6)"
arch=('x86_64')
url="https://github.com/chrislongros/fsrsr"
license=('MIT')
depends=('r' 'rust')
makedepends=('git')
source=("git+https://github.com/chrislongros/fsrsr.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/fsrsr"
    R CMD INSTALL --build .
}

package() {
    cd "$srcdir/fsrsr"
    install -dm755 "$pkgdir/usr/lib/R/library"
    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" .
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
