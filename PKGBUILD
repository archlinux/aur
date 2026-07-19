# Maintainer: Iman <zolfaghari19@gmail.com>
pkgname=paste-links
pkgver=0.1.54
pkgrel=1
pkgdesc="Add Paste Symlink Here action to GNOME Files"
arch=('any')
url="https://github.com/imz87/paste-links"
license=('MIT')
depends=('nautilus' 'python-gobject' 'gtk4' 'python-nautilus')
source=("https://github.com/imz87/paste-links/archive/refs/tags/v0.1.54.tar.gz")
sha256sums=('159b12cf893c0cb279c92259d5ef884a4d00987251dabffc5f8c8e610731416b')

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
