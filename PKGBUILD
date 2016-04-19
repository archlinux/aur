# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='poseur'
pkgname="python-${_pkgname}"
pkgver=0.1.0
pkgrel=2
pkgdesc='Python 3 Bi-directional RPC Framework using ZeroMQ and Asyncio'
arch=('any')
url='https://github.com/ArroyoNetworks/poseur'
license=('MIT')
depends=('python-pyzmq')
makedepends=('python' 'python-setuptools')
optdepends=('python-msgpack: For MessagePack Codec Support')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('183771d4fbb78a49661372ca37bfceb642c83c87345165df88ea83ddd8f0cec4')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
  # License Files
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
