# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.3
pkgrel=3
pkgdesc="Adds SQL read/write support to agate"
arch=('any')
url="http://agate-sql.readthedocs.org/"
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-sqlalchemy>=1.0.8'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
    'python-sphinx_rtd_theme>=0.1.6'
  )
source=("https://github.com/wireservice/agate-sql/archive/${pkgver}.tar.gz")
sha256sums=('73f7ed13092a0ec18f94820290e5c372cfeea256daef53300ae168965d40a37a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  python setup.py build_sphinx
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgname-$pkgver/build/sphinx/html" "$pkgdir/usr/share/doc/$_pkgname"
}
