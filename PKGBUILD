# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgbase=python-ruffus
pkgname=('python-ruffus' 'python2-ruffus')
pkgver=2.7.0
pkgrel=1
pkgdesc="A lightweight Python library for computational pipelines."
arch=('any')
url="http://www.ruffus.org.uk/"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/r/ruffus/ruffus-${pkgver}.tar.gz")
sha256sums=('4bd46461d31aa532357019a33d8045f4e57e52f4ee41643b5b3a7372e380cae0')

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
