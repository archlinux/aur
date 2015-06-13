# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-vitalus
pkgver=0.4.1
pkgrel=1
pkgdesc="Python rsync wrapper for backup"
arch=('any')
url="https://github.com/sciunto/Vitalus"
license=('GPL3')
depends=('python' 'python-psutil' 'rsync')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/V/Vitalus/Vitalus-${pkgver}.tar.gz)
sha256sums=('a8fa40e8691d0416d4d30c3c9d900ff575b9dfdec3f954c193b2b23dd766ae77')

check() {
  cd "$srcdir/Vitalus-$pkgver"
  nosetests3
}

package() {
  cd "$srcdir/Vitalus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
