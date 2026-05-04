pkgname=glimpse-desktop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland shell, status panel, and wallpaper daemon for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('1b9c6c5ff02705ef863c3309d313d13b34122c17e581a2abbf47a047d26a45acb6f58304105345f3c8e4b8f08dbfae2faa3fd5b2e22c1c958a65d099c5982661')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
