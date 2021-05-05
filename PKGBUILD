# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
_pythonmod=Safe
pkgname=python2-safe
pkgver=0.4
pkgrel=1
pkgdesc="Check the password strength for you."
arch=('any')
url="https://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('a2fdac9fe8a9dcf02b438201d6ce0b7be78f85dc6492d03edfb89be2adf489de')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

check() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py test
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
