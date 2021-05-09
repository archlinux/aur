# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-aia')
pkgver=0.1.0
pkgrel=1
pkgdesc="AIA chasing through OpenSSL for TLS certificate chain "`
       `"building and verifying"
arch=('any')
url='https://github.com/danilobellini/aia'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-cryptography' 'openssl')
options=(!emptydirs)
sha256sums=('4ac564372fcdc40803021e941b8fed6fe0b1c8f635dcb1c0b981de3f6765c9e3')
source=("aia-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/aia-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
