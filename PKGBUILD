pkgname="popstar"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An AUR helper with a TUI!"
arch=("x86_64")
url="https://github.com/LiterallyKirby/Popstar"
license=("custom")
depends=("go" "git" "base-devel")
makedepends=("go" "git")
source=("git+https://github.com/LiterallyKirby/Popstar.git")
sha256sums=("SKIP") # Use 'SKIP' for VCS packages, or verify manually if needed.

build() {
    cd "$srcdir/Popstar"
    go build -o popstar
}

package() {
    cd "$srcdir/Popstar"
    install -Dm755 popstar "$pkgdir/usr/bin/popstar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
