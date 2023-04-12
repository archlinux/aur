pkgbase='python2-pillow-5.1.0'
pkgname=('python2-pillow-5.1.0')
_module='Pillow'
pkgver='5.1.0'
pkgrel=1
pkgdesc="Python Imaging Library (Fork)"
url="https://python-pillow.org"
depends=('python2')
makedepends=('python2-setuptools')
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('cee9bc75bff455d317b6947081df0824a8f118de2786dc3d74a3503fd631f4ef')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
