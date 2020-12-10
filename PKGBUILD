# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=dateutils
pkgname=python-$_pkgname
pkgver=0.6.12
pkgrel=1
pkgdesc="Utilities for working with datetime objects."
arch=('any')
url="https://github.com/plytophogy/python-dateutils"
license=('ISC')
depends=('python-dateutil' 'python-argparse' 'python-pytz')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('03dd90bcb21541bd4eb4b013637e4f1b5f944881c46cc6e4b67a6059e370e3f1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
