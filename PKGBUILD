# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.1.0
pkgrel=3
pkgdesc="Switch between nvidia and bumblebee"
arch=('any')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/erayaydin/xgraphic/archive/v${pkgver}.tar.gz")
sha256sums=('c8eff6010cdd894d1f3a8a711c8408a73008b911b0d02deb5d83e27eae6f5451')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  msg "Copying license..."
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Running setup.py"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
