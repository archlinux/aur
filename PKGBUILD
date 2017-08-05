# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru' 'python2-pylru')
_name=pylru
pkgver=1.0.9
pkgrel=2
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('71376192671f0ad1690b2a7427d39a29b1df994c8469a9b46b03ed7e28c0172c')

prepare() {
  cp -a $_name-$pkgver{,-python2}
}

package_python-pylru() {
  depends=('python')
  makedepends=('python-setuptools')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pylru() {
  depends=('python2')
  makedepends=('python2-setuptools')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
