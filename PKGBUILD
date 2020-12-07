# Maintainer: Jiachen YANG <farseerfc@gmail.com>

pkgname=python-hs-dbus-signature
_pkgname=hs-dbus-signature
pkgver=0.07
pkgrel=1
pkgdesc="dbus signature hypothesis strategy generator"
url="https://github.com/stratis-storage/hs-dbus-signature"
depends=('python-hypothesis' )
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose')
license=('MPL2')
arch=('any')
source=("https://github.com/stratis-storage/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('eb4ff3c5bc16bb6c64a0e5447d4f870a3d0f667d3ca3a88118ba0d4bfef775fa')

check() {
    cd ${_pkgname}-${pkgver}
    nosetests
}
 
build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 
}
