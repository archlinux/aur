# Maintainer: Florijan Hamzic <fh@infinicode.de>

_pkgname=crossbar
pkgname=python-crossbar
pkgver=21.3.1
pkgrel=1
pkgdesc="Crossbar.io - WAMP application router http://crossbar.io/"
arch=('any')
url="https://github.com/crossbario/crossbar"
license=('AGPL')
makedepends=('python-setuptools')
depends=('python>=3.7'
         'python-autobahn'
         'python-yaml'
         'python-pygments'
         'python-pytrie'
         'python-pyopenssl'
         'python-txtorcon'
         'python-passlib'
         'python-werkzeug'
         'python-watchdog'
         'python-u-msgpack'
         'python-sdnotify'
         'python-urllib3'
         'python-treq'
         'python-setproctitle'
         'python-pyqrcode'
         'python-ubjson'
         'python-psutil'
         'python-priority'
         'python-netaddr'
         'python-mistune'
         'python-jinja'
         'python-importlib_resources'
         'python-idna'
         'python-h2'
         'python-cbor'
         'python-bcrypt'
         'python-bitstring'
         'python-ujson'
         'python-argon2_cffi'
         'python-snappy'
         'python-pynacl'
         'python-colorama'
         'python-numpy'
         'python-flatbuffers'
         'python-msgpack'
         'python-zlmdb')
source=($pkgname-$pkgver.tar.gz::https://github.com/crossbario/crossbar/archive/v${pkgver}.tar.gz)
sha1sums=('ee79e94a50b194ba6288fb5f853c1183b92d5343')

package(){
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -ie 's/<[0-9.]*,//' requirements-min.txt
    sed -ie 's/<[0-9.]*,//' requirements-latest.txt
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
