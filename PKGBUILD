# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-jwt' 'python2-jwt')
_pkgbase='pyjwt'
pkgver=1.4.0
pkgrel=1
pkgdesc="JSON Web Token implementation"
arch=(any)
url="https://github.com/jpadilla/pyjwt"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/jpadilla/pyjwt/archive/${pkgver}.tar.gz")
sha256sums=('821c2ed6cb8b6fd1c817832551ff459626ab58edb2642db0fd6f43bd320cf9be')
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
}

# vim:set ts=2 sw=2 et:
