# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-nose2' 'python2-nose2')
pkgver=0.6.1
pkgrel=1
pkgdesc="The next generation of nicer testing for python"
arch=(any)
url="https://github.com/nose-devs/nose2"
license=('BSD')
options=(!emptydirs)
source=("https://github.com/nose-devs/nose2/archive/${pkgver}.tar.gz")
sha256sums=('2afcd6684ffa5d1dbeead3bcb4bda6cbc0b95d2c505df64e15b3b242081d6753')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-nose2() {
  depends=('python' 'python-six')
  cd "$srcdir/nose2-$pkgver"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nose2() {
  depends=('python2' 'python2-six')
  cd "$srcdir/nose2-$pkgver"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm "$pkgdir/usr/bin/nose2"
}

# vim:set ts=2 sw=2 et:
