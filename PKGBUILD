# Maintaner: jskier <jay@jskier.com>
# Contributor: jskier <jay @jskier.com>
pkgname=python-authy
pkgver=2.2.4
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
sha256sums=('93e28646dd54eb960a522f948f93bef0ca61f073145b7d4d5aa9fe726e640513')

package() {
  cd "$srcdir/authy-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

