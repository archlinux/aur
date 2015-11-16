# Maintainer: parazyd <parazyd at gmx dot com>
pkgname=monkeysign
pkgver=2.0.2
pkgrel=2
pkgdesc="OpenPGP Key Exchange for Humans"
arch=('any')
url="http://web.monkeysphere.info/monkeysign/"
license=('GPL3')
depends=('python2-qrencode' 'gtk2' 'pygtk' 'zbar' 'python2-imaging')
makedepends=('python2-setuptools' 'git')
source=('https://projectarch.tk/pub/aur/${pkgname}/${pkgname}_${pkgver}.tar.gz')
sha256sums=('01393cfd61c88f1c329e1bcb73f4d3fa17211f32ed7aa955721288e42d32f90a')

pkgver() {
    cd "${pkgname}-${pkgver}"
    echo "$(git describe --long --tags | tr - .)"
}


build() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd monkeysign
    python2 setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
