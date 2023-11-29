# Maintainer: Florine W. Dekker
pkgname="mommy"
pkgdesc="mommy's here to support you~"
pkgver=1.2.5
pkgrel=1
url="https://github.com/FWDekker/mommy"
license=("Unlicense")
arch=("any")
depends=("sh")
checkdepends=("shellspec" "man-db")
optdepends=("man-db: for manual pages" "fish: for tab completion" "zsh: for tab completion")
source=("git+https://github.com/FWDekker/mommy.git#tag=v$pkgver")
sha256sums=("SKIP")

check() {
    cd "$pkgname"
    make test/unit
}

package() {
    cd "$pkgname"
    make prefix="$pkgdir/usr/" install
}
