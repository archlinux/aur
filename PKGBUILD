# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-webweb
pkgver=0.0.35
pkgrel=1
pkgdesc="An easy-to-use network visualization tool."
arch=('i686' 'x86_64')
url='https://webwebpage.github.io/'
license=(GPLv3+)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('610acadaaf07e10099cdd090178c6c25a6472c80692b29f9b9c3775a0149b0aa')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
