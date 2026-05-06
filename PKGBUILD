pkgname=glimpse-desktop-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Wayland shell, status panel, idle, lock screen, wallpaper, and sunset daemons for the Glimpse ecosystem"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/glimpse"
license=('custom:unknown')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'libheif' 'pam')
provides=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
conflicts=('glimpse-panel' 'glimpse-shell' 'glimpse-idle' 'glimpse-lock' 'glimpse-sunset' 'glimpse-wallpaper')
source_x86_64=("glimpse-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/glimpse-$pkgver-x86_64.tar.zst")
b2sums_x86_64=('544881dfecbd8a22ef78c9e4df6db1d00d140ac8d2044f79044e5520e1a730e1f8425f1de3c31343a1369ca546c1cf2354846790a26b48e48dacd8f7e9994a1e')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [[ -d "$srcdir/etc" ]]; then
        cp -a "$srcdir/etc" "$pkgdir/"
    fi
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
