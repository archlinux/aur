# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.1.2
pkgrel=1
pkgdesc="Switch between nvidia and bumblebee"
arch=('any')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/erayaydin/xgraphic/archive/v${pkgver}.tar.gz")
sha256sums=('b408c1b646530a40a4351142cfd34c2022f6f3691d91d1a24f1c2a35a3460c1b')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  msg "Copying license..."
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg "Running setup.py"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
