# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=adwaita-for-steam
pkgver=0.37
pkgrel=1
pkgdesc='A skin to make Steam look more like a native GNOME app'
arch=(any)
url=https://github.com/tkashkin/$pkgname
license=(MIT)
depends=(sssm cantarell-fonts)
optdepends=("steam: if you don't use the flatpak version of Steam")
makedepends=(git)
source=(git+$url#tag=v$pkgver)
b2sums=('SKIP')
install=adwaita-for-steam.install

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  find Adwaita -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/steam/skins/{}" \;
}
