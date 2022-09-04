# Maintainer: Florijan Hamzic <fh@infinicode.de>
# Maintainer: kwrazi <gmail.com>

_pkgname=crossbar
pkgname=python-crossbar
pkgver=22.6.1
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
# source=($pkgname-$pkgver.tar.gz::https://github.com/crossbario/crossbar/archive/v${pkgver}.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/crossbario/crossbar/tar.gz/refs/tags/v${pkgver})
sha1sums=('e66337fce96ed3d0b98b75f2efc18f8e80ecca0a')

package(){
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -ie 's/<[0-9.]*,//' requirements-min.txt
    sed -ie 's/<[0-9.]*,//' requirements-latest.txt
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
