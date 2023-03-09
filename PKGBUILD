# Maintaner: jskier <jay@jskier.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=7.16.5
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests>=2.0.0' 'python-mock' 'flake8'
	'python-six' 'python-nose' 'python-pyjwt' 'twine')
options=(!emptydirs)
source=("https://github.com/twilio/twilio-python/archive/${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('fdbb9943a4dfd291a3f7ce076fd138a7a3b3364c13c9c02ae09514fa982646dc'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

