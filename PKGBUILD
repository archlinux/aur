# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=4.0.0
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
depends=('python' 'python-httplib2>=0.7' 'python-socks' 'python-pytz'
         'python-six')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/twilio/twilio-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('b95a96ff916922a5ae13dfbcdb1968db695ebc66f385e255db6ed3736a16be64'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
