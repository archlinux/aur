pkgname=freqtrade
pkgver=2021.11
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
sha256sums=('e258c325cb9686afdc95d7ef827e2524457aa269745cb4202672ab4539a9aa41')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  rm -rf tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install -O1 --skip-build --root="$pkgdir"
}
