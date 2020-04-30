# Maintaner: jskier <jay@jskier.com>
# Contributor: jskier <jay @jskier.com>
pkgname=python-authy
pkgver=2.2.6
pkgrel=1
pkgdesc="A module for using the Twilio Authy REST API"
arch=('any')
url="https://github.com/twilio/authy-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-six' 'python-simplejson'
	'python-mockito' 'python-mock' 'python-bumpversion')
options=(!emptydirs)
source=("https://github.com/twilio/authy-python/archive/v${pkgver}.tar.gz")
sha256sums=('58cc3d9a1d01a3d2eda27a6e8dff0ae7fc57687171f07741135506d95fa634f2')

package() {
  cd "$srcdir/authy-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

