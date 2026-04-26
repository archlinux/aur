# Maintainer: tantour
pkgname=aurdash-bin
pkgver=1.0  # Update this to match your GitHub Release version
pkgrel=1
pkgdesc="A high-performance Rust TUI for searching, installing, and auditing AUR/Official packages with security scoring."
arch=('x86_64')
url="https://github.com/tantour/aurdash"
license=('MIT')
depends=('pacman' 'glibc' 'gcc-libs')
provides=('aurdash')
conflicts=('aurdash')

# This line tells Arch to download your binary and rename it locally for easier handling
source=("$pkgname-$pkgver::https://github.com/tantour/aurdash/releases/download/v$pkgver/aurdash-x86_64")

# Keep this as 'SKIP' until you run the 'updpkgsums' command mentioned below
sha256sums=('3bb2369a029907a0be87768e076790e93060eac87254b1d121dbc50419d3f823')

package() {
    # 1. Create the destination directory in the package root
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/aurdash"
    
    # 2. (Optional) If you have a license file in your repo, you can install it too:
    # install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
