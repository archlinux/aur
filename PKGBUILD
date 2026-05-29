pkgname=glimpse-desktop-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Wayland shell, status panel, idle, lock screen, wallpaper, and sunset daemons for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam' 'geoclue')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('603762756d0823bf158d8036458df2eee46e8c8067c809a975e23a4a25a7194d25f24b3fbacff9e1a08224250610d104ea54674ae003ca4c73d31e4a97168a41')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
