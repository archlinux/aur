pkgname='python2-pip2pkgbuild'
_module='pip2pkgbuild'
pkgver='0.3.6'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('fd9880aaf0aba7cd6d6bb9e867f40de19511d6d45a5cb315ddf4804f91a16b2b')

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
