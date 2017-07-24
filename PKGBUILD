# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=6.4.3
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-httplib2>=0.7' 'python-pysocks' 'python-pytz'
         'python-six')
options=(!emptydirs)
source=("https://pypi.python.org/packages/b8/5f/b048fb863251d3225ff08161a8c7477f9f79a5d1b37b2bbc1eac78210cac/twilio-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('8fed3a1edb7d0eaa74490c8413879b459be36f7b5f79a57b3c19718d197502c5'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
