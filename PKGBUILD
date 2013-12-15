# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-twilio
pkgver=3.6.4
pkgrel=3
pkgdesc="A module for using the Twilio REST API and generating valid TwiML."
arch=('any')
url="https://github.com/twilio/twilio-python"
license=('MIT')
depends=('python' 'python-httplib2' 'python-socksipy-branch')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/twilio/twilio-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('8a1e2059758204bacc206ce6bd63d7a0b0393e31e21a26ca5031bb1c80c0f4a5'
            '17db7e6dddc3a621518f20dd4b35dac73f25160680d2a4858654eca1019bdea6')

package() {
  cd "$srcdir/twilio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
