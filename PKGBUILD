# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=3.6.5
pkgrel=1
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
depends=('python' 'python-httplib2' 'python-socks')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/twilio/twilio-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('51e66ac425651d763eff427e8b00290e63af38d3c258b095e41825b251a30acb'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
