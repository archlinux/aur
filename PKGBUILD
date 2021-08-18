# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=papirus-nord
pkgver=3.1.0
pkgrel=1
epoch=1
pkgdesc="Custom colors for folder icons for Papirus Icon Theme!"
arch=('any')
url="https://www.pling.com/p/1360398"
license=('GPL2')
depends=('papirus-icon-theme')
optdepends=('papirus-linux-universe: change folder colors')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Adapta-Projects/Papirus-Nord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e0b902f84c951df16265be0322b3c5b391f5c52e3a566e9eb1b347a68067377a')

package() {
  cd Papirus-Nord-$pkgver
  for i in 22 24 32 48 64; do
    install -d "$pkgdir/usr/share/icons/Papirus/${i}x${i}/places"
    cp -r Icons/${i}x${i}/* "$pkgdir/usr/share/icons/Papirus/${i}x${i}/places"
  done
}
