# Maintainer: Maciej <macrionyn@proton.me>

pkgname=tinte
pkgver=1.0.3
pkgrel=1
pkgdesc="Wallpaper utility and theme generator for Wayland"
arch=('any')
url="https://github.com/Maciejonos/tinte"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'libsoup3' 'imagemagick' 'matugen')
provides=('tinte')
conflicts=('tinte')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Maciejonos/tinte/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85c37211c5622f564a18cda5e9abaf36e87b6daa0d548883226ed4f42fea70cb')

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
