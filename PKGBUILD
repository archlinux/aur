# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=warthunder
pkgver=1.0.7
pkgrel=1
pkgdesc='Updater and launcher for War Thunder - a combat game dedicated to WW2'
arch=('x86_64')
url='http://warthunder.com/'
license=('custom')
source=("warthunder.sh")
source_x86_64=("http://yup2.gaijinent.com/updater_${pkgver}.tar.gz")
sha256sums=('885b1ef426a98365a68699dfb6d6bc1e3f99a1624eebcffae8c00facb2bd3e3a')
sha256sums_x86_64=('312b247a7f04281cebafe07d98a2a38ccf23e3e9983eff89935f1f91378821d2')

package() {
  cd "$srcdir/WarThunder"
  install -Dm755 "$srcdir/warthunder.sh" "$pkgdir/usr/bin/warthunder"
  install -Dm755 updater     "$pkgdir/usr/lib/warthunder/bin/updater"
  install -Dm644 updater.blk "$pkgdir/usr/lib/warthunder/bin/updater.blk"
  ln -s /usr/lib/warthunder/bin/updater "$pkgdir/usr/bin/warthunder-updater"
}
