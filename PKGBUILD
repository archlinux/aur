# Maintainer: parazyd <parazyd at gmx dot com>
pkgname=monkeysign
pkgver=2.0.2
pkgrel=1
pkgdesc="OpenPGP Key Exchange for Humans"
arch=('any')
url="http://web.monkeysphere.info/monkeysign/"
license=('GPL3')
depends=('python2-qrencode' 'gtk2' 'pygtk' 'zbar' 'python2-imaging')
makedepends=('python2-setuptools')
source=(http://cdn.debian.net/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz)
md5sums=('914d479599cb1fbd9473a4ea54e36217')
sha256sums=('c883dc0c4f1dbd313239012e1c5984a6ef19b0e5040e613e1727085aa619bf63')

build() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
