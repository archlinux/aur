pkgname=jasmine-wallpaper
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK wallpaper helper for matugen + swww"
arch=("any")
url="https://github.com/xo-xo-xo-xo/jasmine-wallpaper"
license=("unknown")
depends=("python" "python-gobject" "gtk3" "gdk-pixbuf2" "matugen" "swww")
optdepends=("python-cairo: smoother sparkle rendering")
source=("$url/archive/refs/tags/$pkgver.zip")
sha256sums=("54b0d35f27392a19a6012ac93ff16a3acdc62b8e98efd91d8d8b2126bc163406")

package() {
  _srcdir="$srcdir/jasmine-wallpaper-$pkgver"
  install -Dm755 "$_srcdir/src/jasmine.py" "$pkgdir/usr/bin/jasmine-wallpaper"

  install -Dm644 "$_srcdir/assets/jasmine.ttf" \
    "$pkgdir/usr/share/jasmine-wallpaper/assets/jasmine.ttf"
  install -Dm644 "$_srcdir/assets/jasmine.svg" \
    "$pkgdir/usr/share/jasmine-wallpaper/assets/jasmine.svg"

  install -Dm644 "$startdir/jasmine-wallpaper.desktop" \
    "$pkgdir/usr/share/applications/jasmine-wallpaper.desktop"
  install -Dm644 "$_srcdir/assets/jasmine.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/jasmine-wallpaper.svg"
}
