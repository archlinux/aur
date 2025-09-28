pkgname=snowfall-ascii
pkgver=1.0
pkgrel=1
pkgdesc="Full screen ASCII snowfall art"
arch=('any')
url="https://github.com/Akrati00/snowfall-ascii"
license=('GPL')
depends=('bash' 'jp2a' 'coreutils' 'ncurses')

# fetch files from GitHub
source=("https://github.com/Akrati00/snowfall-ascii/raw/main/snowfall"
        "https://github.com/Akrati00/snowfall-ascii/raw/main/snowfall.png")
sha256sums=('SKIP' 'SKIP')  # skip checksum for simplicity

package() {
    install -Dm755 "$srcdir/snowfall" "$pkgdir/usr/bin/snowfall"
    install -Dm644 "$srcdir/snowfall.png" "$pkgdir/usr/share/snowfall-ascii/snowfall.png"

    if [[ -f "$srcdir/README.md" ]]; then
        install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
