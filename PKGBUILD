# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-atomiclong
pkgname=(python-atomiclong python2-atomiclong)
pkgver=0.1.1
pkgrel=1
pkgdesc="Python thread-safe counter using CFFI"
arch=('any')
url="https://pypi.python.org/pypi/atomiclong"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/a/atomiclong/atomiclong-$pkgver.tar.gz)
sha256sums=('cb1378c4cd676d6f243641c50e277504abf45f70f1ea76e446efcdbb69624bbe')

package_python-atomiclong() {
  depends=('python')

  cd "${srcdir}"/atomiclong-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
#license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-atomiclong() {
  depends=('python2')

  cd "${srcdir}"/atomiclong-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1
#license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
