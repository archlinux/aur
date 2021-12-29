pkgname=freqtrade
pkgver=2021.12
pkgrel=1
pkgdesc="Free, open source crypto trading bot"
url="https://github.com/freqtrade/freqtrade"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
depends=('python-sqlalchemy' 'python-cachetools'
         'python-arrow' 'python-requests' 'ta-lib' 'python-pip' 'python-tests'
         'python-urllib3' 'python-wrapt' 'python-pandas' 'python-scikit-learn'
         'python-scipy' 'python-jsonschema' 'python-numpy' 'python-technical'
         'python-pytest-mock' 'python-pytest-cov' 'python-networkx'
         'python-telegram-bot' 'python-tabulate' 'python-hyperopt' 'python-ta-lib'
         'python-bittrex' 'python-questionary' 'python-jinja' 'python-sdnotify' 'python-rapidjson'
         'python-hyperopt' 'python-coinmarketcap' 'python-ccxt' 'python-certifi' 'python-aiohttp')

source=(https://github.com/freqtrade/freqtrade/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8067c72131c3d23b58b6e92c1a11f5f24201fea3db286d878a8f200883643378')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  rm -rf tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf tests
  python setup.py install -O1 --skip-build --root="$pkgdir"
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 

}
