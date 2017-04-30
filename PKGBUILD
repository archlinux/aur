# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: parazyd <parazyd AT dyne DOT org>

pkgname=monkeysign-git
pkgver=2.2.3.g37fabfe
pkgrel=1
pkgdesc="OpenPGP Key Exchange for Humans"
arch=('any')
url="http://web.monkeysphere.info/monkeysign/"
license=('GPL3')
depends=('python2-qrencode' 'gtk2' 'pygtk' 'zbar' 'python2-imaging' 'python2-pysocks')
makedepends=('python2-setuptools' 'git' 'python2-sphinx')
source=('git+https://0xacab.org/monkeysphere/monkeysign.git')
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
