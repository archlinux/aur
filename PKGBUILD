# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.2.0
pkgrel=1
pkgdesc="Switch between nvidia and bumblebee"
arch=('any')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/erayaydin/xgraphic/archive/v${pkgver}.tar.gz")
sha256sums=('076c7d676859c3852535b68ef8b487d3443c1cf6f987ed174a86c0cbc586fc5b')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  msg "Copying license..."
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Running setup.py"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
