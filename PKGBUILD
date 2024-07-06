# Maintainer: mdaniels5757 <arch at mdaniels dot me>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-secrets-manager-core
pkgver=16.6.4
pkgrel=1
pkgdesc="Python SDK for Keeper Secrets Manager"
arch=('any')
url="https://pypi.org/project/keeper-secrets-manager-core/"
license=('MIT')
depends=('python'
         'python-requests>=2.28.2'
         'python-cryptography>=39.0.1'
         'python-importlib-metadata>=6.0.0'
         'python-pytest>=7.2.1'
         'python-setuptools'
         )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname}-$pkgver.tar.gz")
sha256sums=('9ac831df0666b9cbea625b5f7bb51fa96445ac4205750bc4cd2a5e0fc2e48be6')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
