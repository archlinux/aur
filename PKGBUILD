# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('poplines' 'python-poplines')
_realName=popLines
pkgdesc="Tools to pop/peek lines from the head/tail or known position within a given file, and output to stdout. Makes files into queues!"
pkgver=2.1.1
pkgrel=3
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/popLines"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/popLines/archive/${pkgver}.tar.gz")
sha512sums=("c1d528760681132a7f9d8221e7b591d0f61d0ab1b550586712584fa1da5f11873c82fc0c38ebbd561014a980e7d11e760dbd3bb9a1a883485182561068bf03e6")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package_poplines() {
  depends=('python-setuptools' 'python' 'python-poplines')
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -Rf "${pkgdir}/usr/lib"
}

package_python-poplines() {
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -Rf "${pkgdir}/usr/bin"
}
