# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname="mommy"
pkgname="mommy-git"
pkgdesc="mommy's here to support you~"
pkgver=1.8.0.r4.g9a1378d
pkgrel=1
url="https://github.com/fwdekker/mommy"
license=("Unlicense")
arch=("any")
depends=("sh")
makedepends=("make")
checkdepends=("shellspec" "man-db")
provides=("mommy=$pkgver")
conflicts=("mommy")
optdepends=("man-db: for manual pages" "fish: for tab completion" "zsh: for tab completion")
source=("git+https://github.com/fwdekker/mommy.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname" || exit
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/$_pkgname" || exit
    make test/unit
}

package() {
    cd "$srcdir/$_pkgname" || exit
    make prefix="$pkgdir/usr/" install
}
