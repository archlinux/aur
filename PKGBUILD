# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=python-social-auth
pkgver=0.2.21
pkgrel=1
pkgdesc="Easy-to-setup social authentication/registration"
arch=(any)
url="https://github.com/omab/python-social-auth"
license=('BSD')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools' 'git')
depends=('python-openid' 'python-requests' 'python-oauthlib'
         'python-requests-oauthlib' 'python-six' 'python-jwt')
source=("git+https://github.com/omab/python-social-auth#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/python-social-auth"
  python setup.py build
}

package() {
  cd "$srcdir/python-social-auth"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
