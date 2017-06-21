# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.1.0
pkgrel=2
pkgdesc="Switch between nvidia and bumblebee"
arch=('any')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/erayaydin/xgraphic/archive/v${pkgver}.tar.gz")
sha256sums=('7c805ba14772801266be3fbbf11be79174ec5718c787c14d1e008d4030d87461')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  msg "Copying license..."
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Running setup.py"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
