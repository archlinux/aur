pkgname=glimpse-desktop-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Wayland shell, status panel, idle policy, lock screen, wallpaper, and night-light services for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam' 'geoclue')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-lock' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('f60a1befaac107ac1a2b637f01ed6f00ecd93a252af32d274d6dbda103eed5aa23230bbbe95a863b5639a8bacdb9a3c65caac21148c372e78999a5268d85a529')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
