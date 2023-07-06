# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=adwaita-for-steam
pkgver=1.3
pkgrel=1
pkgdesc='A skin to make Steam look more like a native GNOME app'
arch=(any)
url=https://github.com/tkashkin/$pkgname
license=(MIT)
depends=(cantarell-fonts)
optdepends=("steam: if you don't use the flatpak version of Steam")
makedepends=(git)
source=(git+$url#tag=v$pkgver $pkgname.sh)
md5sums=('SKIP'
         '515391d36e5e42a64c647f2caf294aec')
install=adwaita-for-steam.install

package() {
  install $pkgname.sh -Dm755 "$pkgdir/usr/bin/$pkgname"
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  find colorthemes fonts web install.py -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
}
