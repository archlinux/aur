# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=darkplaces-mod
pkgver=20130301
pkgrel=2
pkgdesc="Quake mod specific to Darkplaces"
arch=('any')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('darkplaces')
source=(http://icculus.org/twilight/darkplaces/files/darkplacesmod$pkgver.zip
        $pkgname.desktop)
sha256sums=('64cbba822456f4f82c3d9f50cf16122218d70912d5789ba82573e93d35b325fe'
            '073f4fec0be35966c0e8a8a94ee8b118790742c31eb5d6af84989d2e5c9b1001')

build() {
  # Make saner permission modes
  find "$srcdir/dpmod" -type d -execdir chmod 755 {} +
  find "$srcdir/dpmod" -type f -execdir chmod 644 {} +
}

package() {
  install -d "$pkgdir/usr/share/games/quake"
  cp -a "$srcdir/dpmod" "$pkgdir/usr/share/games/quake"

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
