pkgname="sb-bin"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A command-line tool to search binaries in Unix-like systems"
arch=("x86_64")
target="x86_64-unknown-linux-gnu"

url="https://github.com/siaeyy/sb"
license=('MIT')

depends=("glibc")
makedepends=("rust" "cargo")

# For display the descriptions of the binaries
# man-db and groff is required
optdepends=(
    "man-db: For binary descriptions"
    "groff: For binary descriptions"
)

source=("https://github.com/siaeyy/sb/releases/download/v${pkgver}/sb_${target}")
sha256sums=("sha256:0a89c6f78a7e5261e7028e032c477f3d0840fb82031177029ab483c53f4a4a9d")

package() {
    cd "$srcdir"
    install -Dm755 "sb_${target}" "$pkgdir/usr/bin/sb"
}