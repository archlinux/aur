pkgname=qtum-electrum
pkgver=0.18.16
pkgrel=1
pkgdesc='Qtum thin client'
arch=(any)
url=https://qtum.org/
license=(MIT)
depends=(desktop-file-utils
         libsecp256k1
         python-aiohttp
         python-aiohttp-socks
         python-aiorpcx
         python-btchip
         python-certifi
         python-dnspython
         python-ecdsa
         python-jsonrpclib-pelix
         python-matplotlib
         python-protobuf
         python-pyaes
         python-pycryptodomex
         python-pyqt5
         python-qrcode
         python-scrypt
         python-websocket-client
	     python-eth-hash
	     python-pycryptodome
	     python-pysha3
	     python-eth-utils
	     python2-packaging
	     python-cytoolz
	     python2-appdirs
	     python2-pyparsing
	     python2-six
	     python2-packaging
	     python2-setuptools
	     cython
	     cython2
	     python-eth-typing
	     python-toolz
	     python-cytoolz
	     python-eth-utils	     
	     zbar)
source=("https://github.com/qtumproject/qtum-electrum/archive/v$pkgver.tar.gz")
sha256sums=(e2cef9d3b33498e5d0113bbd1d7e6e8f2317c2fdc27665e091e08bda5ae3f3d7)



build() {
  cd qtum-electrum-$pkgver
  ./setup.py build
}

package() {
  cd qtum-electrum-$pkgver
  ./setup.py install -O1 --root="$pkgdir" --skip-build
  install -Dm755 "$pkgdir/"/usr/bin/run_qtum_electrum "$pkgdir/"/usr/bin/qtum-electrum
  install -Dm755 "srcdir/"../qtum-electrum.desktop "$pkgdir"/usr/share/applications/
  install -Dm755 "$pkgdir/"/usr/share/pixmaps/electrum.png "$pkgdir/"/usr/share/pixmaps/qtumelectrum.png
  rm "$pkgdir/"/usr/share/pixmaps/electrum.png
  rm "$pkgdir/"/usr/bin/run_qtum_electrum

}
