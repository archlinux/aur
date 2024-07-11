# Maintainer: mdaniels5757 <arch at mdaniels dot me>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-secrets-manager-core
pkgver=16.6.5
pkgrel=1
_pypifilestem=${pkgname//-/_}
pkgdesc="Python SDK for Keeper Secrets Manager"
arch=('any')
url="https://pypi.org/project/keeper-secrets-manager-core/"
license=('MIT')
depends=('python'
         'python-requests>=2.28.2'
         'python-cryptography>=39.0.1'
         'python-importlib-metadata>=6.0.0'
         )
makedepends=('python-setuptools')
source=("$_pypifilestem-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$_pypifilestem/$_pypifilestem-$pkgver.tar.gz")
sha256sums=('3c443255dddd6b08c539136d6a78ebb1ed9b59197aef271dbb7538af942807fe')

package() {
  ls -la
  cd "$_pypifilestem-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
