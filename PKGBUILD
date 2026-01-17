# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=r-fsrs
pkgver=0.1.0
pkgrel=1
pkgdesc="R bindings for fsrs-rs spaced repetition algorithm (FSRS-6)"
arch=('x86_64')
url="https://github.com/chrislongros/r-fsrs"
license=('MIT')
depends=('r' 'r-r6' 'r-jsonlite')
makedepends=('rust' 'cargo' 'pandoc' 'r-knitr' 'r-rmarkdown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrislongros/r-fsrs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "r-fsrs-$pkgver"
    R CMD build .
}

package() {
    cd "r-fsrs-$pkgver"
    install -dm755 "$pkgdir/usr/lib/R/library"
    R CMD INSTALL -l "$pkgdir/usr/lib/R/library" rfsrs_${pkgver}.tar.gz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
