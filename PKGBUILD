# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterblock
pkgver=1.3.0
pkgrel=2
pkgdesc="Extended functionality for Counterparty"
arch=('any')
depends=('cython2'
         'git'
         'leveldb'
         'libxml2'
         'libxslt'
         'mongodb'
         'perl-image-exiftool'
         'python2'
         'python2-aniso8601'
         'python2-appdirs'
         'python2-colorama'
         'python2-configobj'
         'python2-dateutil'
         'python2-flask'
         'python2-gevent'
         'python2-geventhttpclient'
         'python2-gevent-socketio'
         'python2-gevent-websocket'
         'python2-grequests-git'
         'python2-json-rpc'
         'python2-jsonschema'
         'python2-lxml'
         'python2-pillow'
         'python2-prettytable'
         'python2-pycoin'
         'python2-pygeoip'
         'python2-pymongo-2.9'
         'python2-pytest'
         'python2-python-bitcoinlib'
         'python2-pyzmq'
         'python2-redis'
         'python2-repoze.lru'
         'python2-requests'
         'python2-rfc3987'
         'python2-strict-rfc3339'
         'redis'
         'sqlite'
         'zeromq')
makedepends=('python2-setuptools')
optdepends=('armory: for armory_utxsvr'
            'counterparty-cli: Counterparty server'
            'python: for armory_utxsvr')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterblock"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterblock/tar.gz/$pkgver)
sha256sums=('ba529709abc88b709d516524b36353c38d24137b7423fed0c42f1d4aeedb8f66')
install=counterblock.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
