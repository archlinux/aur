# Maintainer: Maciej <macrionyn@proton.me>

pkgname=tinte
pkgver=1.0.1
pkgrel=1
pkgdesc="Wallpaper utility and theme generator for Wayland"
arch=('any')
url="https://github.com/Maciejonos/tinte"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'libsoup3' 'imagemagick' 'matugen')
provides=('tinte')
conflicts=('tinte')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Maciejonos/tinte/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a8d21a82e36ffc5e8bc674d85a53764f5aa8ecc4b5a71873ed5cdc320c5a58c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/tinte"
  cp -r src templates "$pkgdir/usr/share/tinte/"

  install -Dm755 tinte "$pkgdir/usr/bin/tinte"

  install -Dm644 org.tinte.Tinte.desktop "$pkgdir/usr/share/applications/org.tinte.Tinte.desktop"

  if [ -f icon.png ]; then
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/tinte.png"
  fi

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
