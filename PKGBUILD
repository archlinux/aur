# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_name=${pkgname#python-}
pkgver=0.16
pkgrel=1
pkgdesc="Sphinx extension to insert the output of arbitrary commands into documents."
arch=('any')
url="https://sphinxcontrib-programoutput.readthedocs.io"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-setuptools')
#options=(!emptydirs)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0caaa216d0ad8d2cfa90a9a9dba76820e376da6e3152be28d10aedc09f82a3b0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
