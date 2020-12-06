# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-requests-http-signature
pkgver=0.0.3
pkgrel=3
pkgdesc="A Requests auth module for the HTTP Signature IETF draft standard RFC"
arch=(any)
url="https://github.com/EliotBerriot/requests-http-signature"
license=('Apache')
options=(!emptydirs)
source=("git+https://github.com/EliotBerriot/requests-http-signature#branch=signature-header-support")
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
depends=('python')

pkgver() {
  cd "requests-http-signature"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/requests-http-signature"
  python setup.py install --root="$pkgdir/" --optimize=1
}
