# Maintainer: WgpArch <wgparch@riseup.net>
pkgname=qwen-minimal-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="Single-file GTK4 chat client for Qwen and Kimi with local/cloud backends"
arch=('any')
url="https://github.com/WgpArch/qwen-minimal-desktop"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4')
optdepends=('ollama: local offline inference')
makedepends=('git')
source=("git+https://github.com/WgpArch/qwen-minimal-desktop.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 main.py "$pkgdir/usr/bin/qwen-minimal-desktop"
    install -Dm644 qwen-minimal-desktop.desktop "$pkgdir/usr/share/applications/qwen-minimal-desktop.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
}
