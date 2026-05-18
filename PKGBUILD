pkgname=hyprtime-bin
pkgver=0.0.2
pkgrel=3
pkgdesc="minimal screen time tracker for hyprland (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/ayanrajpoot10/hyprtime"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('hyprtime' 'hyprtimed')
conflicts=('hyprtime' 'hyprtimed')

source=(
  "https://github.com/ayanrajpoot10/hyprtime/releases/download/v${pkgver}/hyprtime.tar.xz"
  "hyprtime.desktop"
)

sha256sums=('e17d09805ca7a2f8c39106ef5f282f83ab5d4304b711436750ff24dd6264b3ad'
            'd156da8244ca7e16a1a6ff287cf2727c85b5d91da7157d8e03b4c630b56a5999')

package() {
  install -Dm755 "$srcdir/hyprtime" \
    "$pkgdir/usr/bin/hyprtime"

  install -Dm755 "$srcdir/hyprtimed" \
    "$pkgdir/usr/bin/hyprtimed"

  install -Dm644 "$srcdir/hyprtime.desktop" \
  "$pkgdir/usr/share/applications/hyprtime.desktop"
}
