pkgname=glimpse-desktop-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland shell, status panel, wallpaper, and sunset daemons for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-sunset' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-sunset' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('3a32e3e397bf9a49ef8d25a0eafc75b111f2f9e02cb9726b7e57664407e8daf1383d44a1f989d46f951569b75efa3e19cc07e06187cc09605f436bff30454a85')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
