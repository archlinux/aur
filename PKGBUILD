# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgbase=python-ruffus
pkgname=('python-ruffus' 'python2-ruffus')
pkgver=2.8.3
pkgrel=1
pkgdesc="A lightweight Python library for computational pipelines."
arch=('any')
url="http://www.ruffus.org.uk/"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/r/ruffus/ruffus-${pkgver}.tar.gz")
sha256sums=('cf12f5ea6648fd60b046416619a26d9d3237cd555b29b92b5efc7a6f69e3e676')

package_python-ruffus() {
  depends=('python')
  cd "$srcdir/ruffus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-ruffus() {
  depends=('python2')
  cd "$srcdir/ruffus-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
