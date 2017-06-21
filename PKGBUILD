# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.1.0
pkgrel=1
pkgdesc="Switch between nvidia and bumblebee"
arch=('any')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/erayaydin/xgraphic/archive/v${pkgver}.tar.gz")
sha256sums=('f123a031d83a0e5974b4fc75adb95309b290780879ed4ee0e53830bdd2e84345')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  msg "Copying license..."
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Running setup.py"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
