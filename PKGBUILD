# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain
pkgver=1.0.7
pkgrel=6
pkgdesc="Backport of Python 3 csv module."
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/ryanhiebert/backports.csv/archive/${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

sha256sums=('fab7a2ce7bd149cf73144b48dc6c14c85917e2b711c04e9808573816ded3a2ee')
