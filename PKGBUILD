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
b2sums_x86_64=('f5a9b075d71aef24222f56ae45c54426e158d4c00b9784ac28bdc349da2575bb36dd8e270c93ca14a35dc28cea6c35428c98ab9a6cd480aeb9b3099649dce769')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
