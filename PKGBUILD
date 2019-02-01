# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-webweb
pkgver=0.0.17
pkgrel=1
pkgdesc="An easy-to-use network visualization tool."
arch=('i686' 'x86_64')
url='https://webwebpage.github.io/'
license=(GPLv3)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('36dc395ac95d2e4fa9f72b4fcd50011790cf01793868063bd1f874aa77041412')
prepare () {
    cd ${_name}-${pkgver}
    patch -p1 < ../base_path.patch
}
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
