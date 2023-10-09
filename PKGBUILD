# Maintainer: jskier <jay @ jskier.com>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-secrets-manager-core
pkgver=16.6.2
pkgrel=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://files.pythonhosted.org/packages/c8/7a/3900b2f690e0a2f106390c15af9b0f96d5abc4f77b56c34ea6f088a3c0d5"
license=('MIT')
depends=('python'
	 'python-ecdsa'
	 'python-requests'
         'python-cryptography'
	 'python-importlib-metadata'
         'python-pytest'
         )
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha512sums=('ade7d454bb6fbb79e93d6fe52132934ad0aa3014359c67cde1ce11f669698831c1beca42642d2097aeb8fa00bdd9d1004c9a81c1a98c3d434a35c47e94862d66')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
