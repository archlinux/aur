# Maintainer: Francois Boulogne <fboulogne@april.org>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname="python-pandas-git"
pkgver=v0.13.0.r80.gd75c29d
pkgrel=1
pkgdesc="R-like data analyis library for Python."
url="http://pandas.pydata.org"
depends=('python' 'python-numpy' 'python-dateutil' 'python-pytz')
makedepends=('git' 'cython')
optdepends=('python-scipy: miscellaneous statistical functions'
            'python-matplotlib-git: for plotting')
provides=('python-pandas-git')
conflicts=('python-pandas')
arch=('any')
license=('BSD')
source=("git://github.com/pydata/pandas.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pandas"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/pandas"
  python setup.py install --root=${pkgdir} --optimize=1
}
# vim:ts=2:sw=2:et:
