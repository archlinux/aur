pkgname=glimpse-desktop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Wayland shell, status panel, and wallpaper daemon for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('485e57072acc779b2be265a41b22662a44b7d55af3a7572bcac616d42eb0be9a5871d2ef4639835b669a93cc9b8b4cf7b5398acf7ea447fb9021b11e40db3e0f')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
