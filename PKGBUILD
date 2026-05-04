pkgname=glimpse-desktop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Wayland shell, status panel, and wallpaper daemon for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('a2b837b8484493eae11a731a806c63d73e2c4ff5aa9d6b53905c97806e120b7c23f269a61f64d65337c7370b58446b5959e33984fec48439f830a8676a7d1550')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
