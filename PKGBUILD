pkgname=glimpse-desktop-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Wayland shell, status panel, idle, lock screen, wallpaper, and sunset daemons for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('aba5615445591cb32637b65fcaf185a068785aba9ddbcb7899bcb91527ae526a32f0ab18eeb715e97d5307d3dd4a4360547da5f35650b0309ea71bfcb970ad12')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
