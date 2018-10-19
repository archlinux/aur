# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
pkgname=docopts
pkgver=0.6.1+fix
pkgrel=4
pkgdesc="Shell interface for docopt, the CLI description language"
arch=('any')
url="http://github.com/docopt/docopts"
license=('MIT')
depends=('python' 'python-docopt' 'python-setuptools')
source=("https://pypi.python.org/packages/source/d/$pkgname/$pkgname-${pkgver//+/-}.tar.gz" 'LICENSE-MIT')
sha256sums=('563aad461c700a60ffb91bc1c5e548ac05399c8f5a62c65ff3b8359717fd3d87'
            'd15d0ed27754146f2df653e4582db64154ca6498154183c15987b269ae342217')

package() {
  cd "$srcdir/${pkgname/python-}-${pkgver//+/-}"
  python setup.py install -O1 --root="$pkgdir"
  install -Dm0644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
