pkgname=glimpse-desktop-bin
pkgver=0.14.3
pkgrel=1
pkgdesc="Wayland shell, status panel, idle policy, lock screen, wallpaper, and night-light services for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam' 'geoclue')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-lock' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('d4a1ca4d27edbe689f0e3f0d966a636bba4789107ee4e4e1205af6fa702bc7400cd1f2a0c10118ee1d5d37ff53a14ecc9030732a5e3b2ea20d19ce98cd181fae')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
