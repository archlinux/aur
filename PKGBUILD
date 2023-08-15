pkgname='python2-pip2pkgbuild'
_module='pip2pkgbuild'
pkgver='0.3.3'
pkgrel=2
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('90172b48a10a2e416a7844e38892fa9b592af1cabc766938804f91fe62be8fc2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/pip2pkgbuild"{,2}
}
