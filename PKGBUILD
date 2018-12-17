# Maintaner: jskier <jay@jskier.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=6.22.0
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-httplib2>=0.7' 'python-pysocks' 'python-pytz'
         'python-six')
options=(!emptydirs)
source=("https://github.com/twilio/twilio-python/archive/${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('50810f942ea5fcf338d2e6a8f9d7a3a1415be79f0382dcf8db1faaea994d6ab6'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

