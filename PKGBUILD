# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-requests-http-signature' 'python2-requests-http-signature')
pkgver=1.0.2
pkgrel=1
pkgdesc="A Requests auth module for the HTTP Signature IETF draft standard RFC"
arch=(any)
url="https://github.com/EliotBerriot/requests-http-signature"
license=('Apache')
options=(!emptydirs)
source=("git+https://github.com/EliotBerriot/requests-http-signature#branch=signature-header-support")
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools' 'python2-setuptools')

pkgver() {
  cd "requests-http-signature"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-requests-http-signature() {
  depends=('python')
  cd "$srcdir/requests-http-signature"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-requests-http-signature() {
  depends=('python2')
  cd "$srcdir/requests-http-signature"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
