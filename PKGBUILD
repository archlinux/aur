# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>

pkgname=python-keepassx
pkgdesc="library and scriptable command line interface to keepassx"
url="http://keepassx.readthedocs.org"
depends=(
    'python-crypto'
    'python-six'
    'python-prettytable'
    'python-yaml'
    )
makedepends=('python-setuptools')
provides=('michel')
license=('Public Domain')
arch=('any')
pkgver=0.1.0
pkgrel=1
source=(https://pypi.python.org/packages/source/k/keepassx/keepassx-${pkgver}.tar.gz)
md5sums=('5e860ac4edb4c0a080c53ecf1da23bac')

package() {
  cd "$srcdir/keepassx-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  chmod +r ${pkgdir}/* -R
}
