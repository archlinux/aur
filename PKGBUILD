# Maintainer: Mikkel Rask <mikkelrask@users.noreply.github.com>
pkgname=khal-agenda-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='An on-demand Wayland calendar popup for khal (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mikkelrask/khal-agenda'
license=('MIT')
depends=('gtk4>=4.8' 'glibc>=2.39' 'libgcc' 'wayland' 'glib2' 'cairo' 'hicolor-icon-theme' 'python' 'khal')
optdepends=('vdirsyncer: sync local calendar files')
provides=("khal-agenda=$pkgver")
conflicts=('khal-agenda')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/khal-agenda-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('3bd4feb39d66d3dd462b9febfe4608dca81f83b9ad8ce5ce8652f0e14a359f43')

package() {
    install -Dm755 "$srcdir/bin/khal-agenda" "$pkgdir/usr/bin/khal-agenda"
    install -Dm755 "$srcdir/lib/khal-agenda/libgtk4-layer-shell.so.0" \
        "$pkgdir/usr/lib/khal-agenda/libgtk4-layer-shell.so.0"
    install -Dm644 "$srcdir/share/applications/khal-agenda.desktop" \
        "$pkgdir/usr/share/applications/khal-agenda.desktop"
    install -Dm644 "$srcdir/share/icons/hicolor/scalable/apps/khal-agenda.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/khal-agenda.svg"
    install -Dm644 "$srcdir/share/licenses/khal-agenda/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/share/licenses/khal-agenda/gtk4-layer-shell.LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/gtk4-layer-shell.LICENSE"
    install -d "$pkgdir/usr/share/doc/khal-agenda"
    cp -a "$srcdir/share/doc/khal-agenda/." "$pkgdir/usr/share/doc/khal-agenda/"
}
