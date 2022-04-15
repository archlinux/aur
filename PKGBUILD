# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_name=${pkgname#python-}
pkgver=0.17
pkgrel=2
pkgdesc="Sphinx extension to insert the output of arbitrary commands into documents."
arch=('any')
url="https://sphinxcontrib-programoutput.readthedocs.io"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('300ee9b8caee8355d25cc74b4d1c7efd12e608d2ad165e3141d31e6fbc152b7f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
