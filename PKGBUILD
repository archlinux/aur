# Maintainer: parazyd <parazyd at gmx dot com>
pkgname=monkeysign-git
pkgver=2.0.1.42.g461dbae
pkgrel=1
pkgdesc="OpenPGP Key Exchange for Humans"
arch=('any')
url="http://web.monkeysphere.info/monkeysign/"
license=('GPL3')
depends=('python2-qrencode' 'gtk2' 'pygtk' 'zbar' 'python2-imaging')
makedepends=('python2-setuptools' 'git')
source=('git://git.monkeysphere.info/monkeysign')
sha1sums=('SKIP')

pkgver() {
    cd monkeysign
    echo "$(git describe --long --tags | tr - .)"
}

build() {
    cd monkeysign
    python2 setup.py build
}

package() {
    cd monkeysign
    python2 setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
