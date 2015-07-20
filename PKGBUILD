# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=ysbatterytray
pkgver=2.5.6
pkgrel=1
pkgdesc="Battery information via system tray"
arch=('any')
url="http://dev.yaki-syndicate.de/"
license=('GPL')
depends=('python-gobject' 'libnotify')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("d198f538a21b683261a8882763ea718f9aa15a3ba1226679927b930bf99415c3")

package () {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p ${pkgdir}/usr/share/pixmaps/battery/
  install -m644 share/pixmaps/battery/*.png -t ${pkgdir}/usr/share/pixmaps/battery/
  install -Dm755 batterytray ${pkgdir}/usr/bin/batterytray
}
