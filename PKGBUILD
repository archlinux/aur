# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-aia')
pkgver=0.2.0
pkgrel=1
pkgdesc="AIA chasing through OpenSSL for TLS certificate chain "`
       `"building and verifying"
arch=('any')
url='https://github.com/danilobellini/aia'
license=('BSD')
makedepends=('python-setuptools')
depends=('openssl')
options=(!emptydirs)
sha256sums=('1545a94d3823319e07952e89cc8a9d8b92e2fa174dae48a1ce667ce60077969d')
source=("aia-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/aia-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
