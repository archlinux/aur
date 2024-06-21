# Maintaner: jskier <jay@jskier.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=9.2.1
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests>=2.0.0' 'python-mock' 'python-certifi'
	 'python-aiohttp-retry' 'python-pyjwt' 'twine' 'python-aiohttp')
options=(!emptydirs)
source=("https://github.com/twilio/twilio-python/archive/${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('8db9862bb8697357a781b20e2af43bb88e2a07b5723a90b66ff14ce047f38f05'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')
package() {
  cd "$srcdir/twilio-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

