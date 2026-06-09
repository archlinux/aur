# Maintainer: Radu Macocian <radu@macocian.com>
pkgname=omni-launcher
pkgver=0.0.2
pkgrel=1
pkgdesc="Application launcher overlay built on Quickshell, with calculator, unit/currency conversion, unicode search and Giphy search"
arch=('any')
url="https://git.estatecloud.org/radumaco/omni-launcher"
license=('GPL-3.0-or-later')
depends=('quickshell' 'qt6-declarative' 'wl-clipboard' 'curl' 'python' 'glib2')
optdepends=('hyprland: close-on-workspace-change and focus-grab integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f56914b4eaa25c525727d6b59e54f5561a0621778350dfe2d64b8581fc43823a')

package() {
    cd "$srcdir/$pkgname"

    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -m644 qml/* "$pkgdir/usr/share/$pkgname/"

    install -Dm755 bin/omni-launcher          "$pkgdir/usr/bin/omni-launcher"
    install -Dm755 bin/omni-launcher-toggle   "$pkgdir/usr/bin/omni-launcher-toggle"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
