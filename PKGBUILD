# Maintainer: Johan Svensson <johan@loxley.se>
pkgname=halonadm
pkgver=1.0.0
pkgrel=1
pkgdesc="Manage Halon (http://halon.se) SP servers easily"
url="https://github.com/loxley/halonadm"
arch=('any')
license="GPLv2"
depends=('python3'
         'python-suds-jurko')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/h/halonadm/halonadm-${pkgver}.tar.gz")
sha512sums=('b6cb2349cfabb3ce70cbf02fd46b33316db1f742bd07311ab17db8ea01bf1bd5760907b745758113a0dcd799db564ca4f0b146c1086635a4643e5a219bcfbd05')
install=halonadm.install

build() {
    cd halonadm-${pkgver}
    python3 setup.py build
}

package() {
    cd halonadm-${pkgver}
    python3 setup.py install --root="${pkgdir}" -O1

}
