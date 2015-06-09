# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterblock
pkgver=1.2.0.BETA
pkgrel=1
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
         'python2-geventhttpclient-git'
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
         'python2-pymongo'
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterblock/tar.gz/1.2.0-BETA)
sha256sums=('3fd0b51e49c7b6c292313c5a585b8a053beeb51dd5038c9b70eb458b480a3ce3')
install=counterblock.install

build() {
  cd "$srcdir/$pkgname-1.2.0-BETA"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-1.2.0-BETA"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
