# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-vitalus
pkgver=0.4.0
pkgrel=1
pkgdesc="Python rsync wrapper for backup"
arch=('any')
url="https://github.com/sciunto/Vitalus"
license=('GPL3')
depends=('python' 'python-psutil' 'rsync')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(http://source.sciunto.org/vitalus/vitalus-${pkgver}.tar.bz2)


build() {
  cd "$srcdir"
  python setup.py build
}

check() {
  cd "$srcdir"
  nosetests3
}

package() {
  cd "$srcdir"
  python setup.py install --root="${pkgdir}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('a648b8c0ee18443d55346b1565fb332b')
