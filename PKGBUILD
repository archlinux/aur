pkgname=glimpse-desktop-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Wayland shell, status panel, idle policy, lock screen, wallpaper, and night-light services for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam' 'geoclue')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-lock' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('6d70bb86714650a1bab05fbf75215dde7fa563f31737ede0453f97783102bc095f04d4f7e4e5eb09cd4b0fff059012847ae819d95b4e4fd2b0d87a95409d3e82')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
