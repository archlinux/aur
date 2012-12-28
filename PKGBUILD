# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=darkplaces-mod
pkgver=20121222
pkgrel=1
pkgdesc="Quake mod specific to Darkplaces"
arch=('any')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('darkplaces')
source=(http://icculus.org/twilight/darkplaces/files/darkplacesmod$pkgver.zip
        $pkgname.desktop)
sha256sums=('94750e656db5708cb699cde1dbdc2e83b6768c418d01e156d21a7dde4688f6c4'
            '073f4fec0be35966c0e8a8a94ee8b118790742c31eb5d6af84989d2e5c9b1001')

build() {
  # Make saner permission modes
  find $srcdir -type d -print0 | xargs -0 chmod 755
  find $srcdir -type f -print0 | xargs -0 chmod 644
}

package() {
  install -Dd $pkgdir/usr/share/quake
  cp -a $srcdir/dpmod $pkgdir/usr/share/quake

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
