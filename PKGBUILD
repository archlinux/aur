# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pybase62
_pkgname=pybase62
pkgver=0.4.3
pkgrel=1
pkgdesc="Python module for base62 encoding"
arch=("any")
url="https://github.com/suminb/base62"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
sha256sums=('0fbbe8474fc5fb020cc7f94dc88adfd12ef9bf38640c46612568ea07f046438c'
            'ed76f4281e6302b9b0c3956708a856ee4a6b4e97702aedc3fdc7942462fc3dbc')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
