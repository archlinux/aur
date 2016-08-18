# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-social-auth' 'python2-social-auth')
pkgver=0.2.21
pkgrel=1
pkgdesc="an easy-to-setup social authentication/registration mechanism with support for several frameworks and auth providers"
arch=(any)
url="https://github.com/omab/python-social-auth"
license=('BSD')
options=(!emptydirs)
source=("https://github.com/omab/python-social-auth/archive/v${pkgver}.tar.gz")
sha256sums=('76e1ff1aedac684b871e9eeb888da51f9ace0d94a811555ca2bbb80b065eba0f')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-social-auth() {
  depends=('python-openid' 'python-requests' 'python-oauthlib' 'python-requests-oauthlib' 'python-six' 'python-jwt')
  cd "$srcdir/python-social-auth-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-social-auth() {
  depends=('python2-openid' 'python2-requests' 'python2-oauthlib' 'python2-requests-oauthlib'
           'python2-six' 'python2-jwt')
  cd "$srcdir/python-social-auth-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
