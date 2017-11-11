# Maintainer: ngld <ngld@tproxy.de>
_pyname=token_bucket
pkgname=python-token-bucket
pkgver=0.2.0
pkgrel=1
pkgdesc="Very fast implementation of the token bucket algorithm."
arch=('any')
url="https://github.com/falconry/token-bucket"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/74/fb/5c7681fce00acca5df34d63f1b4ee441df72157a92b24e4992f00e69e6c1/token_bucket-0.2.0.tar.gz"
		"https://github.com/falconry/token-bucket/raw/0.2.0/LICENSE")
sha256sums=('76305d9dbe875d3b033b5bf208cc2cf78c003129378108ab1bae919a42b108da'
            '2d93a9d2eada24cb431338d41bba270d09fa01e7f3eb25ff5e096632f6fde151')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
