# Maintainer: Jiachen YANG <farseerfc@gmail.com>

pkgname=python-hs-dbus-signature
_pkgname=hs-dbus-signature
pkgver=0.05
pkgrel=1
pkgdesc="dbus signature hypothesis strategy generator"
url="https://github.com/stratis-storage/hs-dbus-signature"
depends=('python-hypothesis' )
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose')
license=('MPL2')
arch=('any')
source=("https://github.com/stratis-storage/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a2eaab7c0534bfa3a6d85322cda84398daa1435575cdb42039c4648c2acd8076')

check() {
    cd $srcdir/${_pkgname}-${pkgver}
    nosetests
}
 
build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
