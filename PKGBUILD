# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=warthunder
pkgver=1.0.7
pkgrel=3
pkgdesc='Updater and launcher for War Thunder - a combat game dedicated to WW2'
arch=('x86_64')
url='http://warthunder.com/'
license=('custom')
source=('warthunder.sh'
        'warthunder.desktop')
source_x86_64=("http://yup2.gaijinent.com/updater_${pkgver}.tar.gz")
sha256sums=('885b1ef426a98365a68699dfb6d6bc1e3f99a1624eebcffae8c00facb2bd3e3a'
            'fb158698417b58d917566daf5ca42df765d49d99a6f704fc62d7019964ed4236')
sha256sums_x86_64=('312b247a7f04281cebafe07d98a2a38ccf23e3e9983eff89935f1f91378821d2')

package() {
  cd "$srcdir/WarThunder"
  install -Dm755 "$srcdir/warthunder.sh" "$pkgdir/usr/bin/warthunder"
  install -Dm755 updater     "$pkgdir/usr/lib/warthunder/bin/updater"
  install -Dm644 updater.blk "$pkgdir/usr/lib/warthunder/bin/updater.blk"
  ln -s /usr/lib/warthunder/bin/updater "$pkgdir/usr/bin/warthunder-updater"

  # Install desktop file
  cd "$srcdir"
  install -Dm644 warthunder.desktop "$pkgdir/usr/share/applications/warthunder.desktop"
}
