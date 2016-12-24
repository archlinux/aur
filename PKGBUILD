# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-vitalus
pkgver=0.4.2
pkgrel=1
pkgdesc="Python rsync wrapper for backup"
arch=('any')
url="https://github.com/sciunto/Vitalus"
license=('GPL3')
depends=('python' 'python-psutil' 'rsync')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/sciunto/Vitalus/archive/v${pkgver}.tar.gz)
sha256sums=('5e6b1f3a617aa281804f50ff08c9954e5ebd51ea42cc7b1fcf5564fcc23e436e')

check() {
  cd "$srcdir/Vitalus-$pkgver"
  nosetests3
}

package() {
  cd "$srcdir/Vitalus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
