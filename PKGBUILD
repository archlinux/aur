# Maintainer: tn3w <tn3w@protonmail.com>
pkgname=plymouth-theme-arch-ascii
pkgver=1.0.3
pkgrel=1
pkgdesc="A Plymouth theme featuring a centered rainbow-colored Arch Linux ASCII art logo with password input functionality"
arch=('any')
url="https://github.com/tn3w/plymouth-theme-arch-ascii"
license=('MIT')
depends=('plymouth')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tn3w/plymouth-theme-arch-ascii/archive/v$pkgver.tar.gz")
sha256sums=('d4ffffacda580dd719f1089078586cbb28c92b3bf2da718b5412605b56407614')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Create theme directory
    install -dm755 "$pkgdir/usr/share/plymouth/themes/arch-ascii-art"
    
    # Install theme files
    install -Dm644 arch-ascii-art.plymouth "$pkgdir/usr/share/plymouth/themes/arch-ascii-art/"
    install -Dm644 arch-ascii-art.script "$pkgdir/usr/share/plymouth/themes/arch-ascii-art/"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
