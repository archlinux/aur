# Maintainer: Jiachen YANG <farseerfc@gmail.com>

pkgname=python-hs-dbus-signature
_pkgname=hs-dbus-signature
pkgver=0.06
pkgrel=5
pkgdesc="dbus signature hypothesis strategy generator"
url="https://github.com/stratis-storage/hs-dbus-signature"
depends=('python-hypothesis' )
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose')
license=('MPL2')
arch=('any')
source=("https://github.com/stratis-storage/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1fa4f8cea63cabac761b32fa851cc1e85abc60a354c55fbce133412b89ee6dbd')

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
