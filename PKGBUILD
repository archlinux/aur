# Maintainer: Iman <zolfaghari19@gmail.com>
pkgname=paste-links
pkgver=0.1.62
pkgrel=1
pkgdesc="Add Paste Symlink Here action to GNOME Files"
arch=('any')
url="https://github.com/imz87/paste-links"
license=('MIT')
depends=('nautilus' 'python-gobject' 'gtk4' 'python-nautilus')
source=("https://github.com/imz87/paste-links/archive/refs/tags/v0.1.62.tar.gz")
sha256sums=('326b16b513898211e244ea70c3ff6ded480d599477a263cf8478c943a6f0a2c7')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 src/paste_links.py "$pkgdir/usr/share/nautilus-python/extensions/paste_links.py"
    install -Dm644 src/core_logic.py "$pkgdir/usr/share/nautilus-python/extensions/core_logic.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
    echo ""
    echo "Restart Nautilus / GNOME Files for the extension to take effect:"
    echo ""
    echo "  nautilus -q"
    echo ""
    echo "Then reopen Files. The \"Paste Symlink Here\" menu will appear in the context menu."
    echo ""
}
