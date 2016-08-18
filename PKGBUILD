# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-jwt' 'python2-jwt')
_pkgbase='pyjwt'
pkgver=1.4.2
pkgrel=1
pkgdesc="JSON Web Token implementation"
arch=(any)
url="https://github.com/jpadilla/pyjwt"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/jpadilla/pyjwt/archive/${pkgver}.tar.gz")
sha256sums=('f69d80cdfcdd078051012ba2012b43491836c183924414e9047b721615416f1b')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-jwt() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-jwt() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/jwt" "$pkgdir/usr/bin/jwt2"
}

# vim:set ts=2 sw=2 et:
