# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=sphinxcontrib-programoutput
pkgver=0.8
pkgrel=1
pkgdesc="Sphinx extension to include program output"
arch=('any')
url="https://bitbucket.org/birkenfeld/sphinx-contrib"
license=('BSD')
depends=('python' 'python-sphinx')
makedepends=('python')
provides=('sphinxcontrib-programoutput')
options=(!emptydirs)
source=(
  "https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
md5sums=('bb0be17ef13f268378b2af51ff413c58')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  [ $(command -v python2) ] && python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
