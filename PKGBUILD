# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-jwt' 'python2-jwt')
_pkgbase='pyjwt'
pkgver=1.4.1
pkgrel=2
pkgdesc="JSON Web Token implementation"
arch=(any)
url="https://github.com/jpadilla/pyjwt"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/jpadilla/pyjwt/archive/${pkgver}.tar.gz")
sha256sums=('caa35e98dafd811fea665cea0311111fc521187b25805f84d46433de71e412a9')
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
