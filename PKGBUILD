# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=5.6.0
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-httplib2>=0.7' 'python-pysocks' 'python-pytz'
         'python-six')
options=(!emptydirs)
source=("https://pypi.python.org/packages/d4/42/8788d36fb20389c32434f2070faca0ecc4ffe69ab7aa362b512fca0c2dad/twilio-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('d4bfbb70ddc28ac346a3e38c4d562596d01a0842cac78261e0171953199af625'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
