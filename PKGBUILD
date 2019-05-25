# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain
pkgver=1.0.6
pkgrel=2
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

md5sums=('f3fa0a34a9e49dc5df78e7b487e94900')
