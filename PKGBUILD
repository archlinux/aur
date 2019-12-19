# Maintaner: jskier <jay@jskier.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=6.35.1
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
sha256sums=('37ed8cb26e6cff0ac1004de91fd68514465f8db478c7bae15bab2e02ec02c373'
	   '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

