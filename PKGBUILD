# Maintainer: Jozef Gaal <preklady@mayday.sk>
pkgname=orphycleaner
pkgver=1.1.4
pkgrel=1
pkgdesc="OrphyCleaner is a lightweight GUI tool for Arch-based Linux that scans your home directory for orphaned or unused app folders."
arch=('x86_64')
url="https://github.com/dodog/orphycleaner"
license=('AGPL3')
depends=('python' 'tk')
optdepends=('glib2: provides gio for moving deleted folders to Trash')
source=("https://github.com/dodog/orphycleaner/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4103a5d0b89b1de697c4c4ff33bdec7d4554fc8c6e2c3615088f8f94a2bed7d7')

package() {
    cd "$srcdir/$pkgname-${pkgver}" || return

    # Install script
    install -Dm755 orphycleaner.py "$pkgdir/usr/bin/orphycleaner"

    # Desktop entry
    install -Dm644 orphycleaner.desktop "$pkgdir/usr/share/applications/orphycleaner.desktop"

    # PNG icon (128x128 fallback)
    install -Dm644 orphycleaner.png "$pkgdir/usr/share/pixmaps/orphycleaner.png"

    # Scalable SVG icon
    install -Dm644 "$srcdir/$pkgname-$pkgver/icons/orphycleaner.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/orphycleaner.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}