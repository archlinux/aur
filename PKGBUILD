pkgname=hyprtime-bin
pkgver=0.2.0
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

sha256sums=('22449211d58b546193c60f5fd190ef393e42072cb178b3198550c9827af29793'
            'd156da8244ca7e16a1a6ff287cf2727c85b5d91da7157d8e03b4c630b56a5999')

package() {
  install -Dm755 "$srcdir/hyprtime" \
    "$pkgdir/usr/bin/hyprtime"

  install -Dm755 "$srcdir/hyprtimed" \
    "$pkgdir/usr/bin/hyprtimed"

  install -Dm644 "$srcdir/hyprtime.desktop" \
  "$pkgdir/usr/share/applications/hyprtime.desktop"
}
