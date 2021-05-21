# Maintainer: Angel Perez <near1297@nauta.cu>
# Maintainer: Daniel Case <daniel@dashlabs.org>
# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-dash
_pkgname=Dash-Electrum
pkgdesc="Lightweight Bitcoin wallet, fork for DASH"
pkgver=4.1.2.0
pkgrel=0
url="https://electrum-dash.org"
arch=('any')
license=('MIT')

depends=('python-pyaes' 'python-ecdsa' 'python-pbkdf2' 'python-requests' 'python-qrcode'
         'python-protobuf' 'python-dnspython' 'python-jsonrpclib-pelix' 'python-pysocks'
         'python-pyqt5' 'python-pycryptodomex' 'python-websocket-client' 'python-certifi'
         'python-aiorpcx' 'python-aiohttp' 'python-aiohttp-socks' 'python-x11_hash' 'python-bls')
optdepends=('python-btchip: BTChip hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-qdarkstyle: optional dark theme in graphical mode'
            'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes')
makedepends=('python-setuptools')

source=("https://github.com/akhavr/electrum-dash/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8bd9b40a9188f6298003aa150803d07fcf0cb207eff1274f313d68cdc8fbbc0c')

build() {
	cd ${_pkgname}-${pkgver}
	python setup.py build
}

package() {
        cd ${_pkgname}-${pkgver}
        python setup.py install --root="${pkgdir}" --optimize=1
}
