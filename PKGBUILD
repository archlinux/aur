# Maintainer: tsonntig

pkgname=fanicontrol
pkgver=0.31
pkgrel=1
pkgdesc="a new way controling your fans"
arch=('any')
url="https://github.com/tsonntig/Fanicontrol"
license=('GPL2 only')
depends=(python3)
makedepends=('git')
source=('git+https://github.com/tsonntig/Fanicontrol.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/Fanicontrol"
  python arch/setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 'doc/fanic.gz'	"$pkgdir/usr/share/man/man5/fanicontrol.conf.5.gz"
  install -Dm644 'arch/fanicontrol.service' "$pkgdir/usr/lib/systemd/system/fanicontrol.service"
}



