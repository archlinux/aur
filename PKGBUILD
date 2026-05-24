pkgname=hyprtime-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="minimal screen time tracker for hyprland (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/hyprtime"
license=('MIT')
depends=('gtk3')
provides=('hyprtime')
conflicts=('hyprtime')

source=(
  "https://github.com/ayanrajpoot10/hyprtime/releases/download/v${pkgver}/hyprtime.tar.xz"
  "hyprtime.desktop"
)

sha256sums=('0c22de2fa961adf93e784bbb10f38cc3587daf00e4c80c6d4f5492d935c0def5'
            'd156da8244ca7e16a1a6ff287cf2727c85b5d91da7157d8e03b4c630b56a5999')

package() {
  install -Dm755 "$srcdir/hyprtime" \
    "$pkgdir/usr/bin/hyprtime"

  install -Dm755 "$srcdir/hyprtimed" \
    "$pkgdir/usr/bin/hyprtimed"

  install -Dm644 "$srcdir/hyprtime.desktop" \
  "$pkgdir/usr/share/applications/hyprtime.desktop"
}
