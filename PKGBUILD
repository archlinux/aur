pkgbase='novelwriter'
pkgname=('novelwriter')
_module='novelWriter'
pkgver='1.1.1'
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels"
url="https://novelwriter.io"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f736df81a76bd233a1bf0786388a55191f78a8268e34e593e57ea44eae42576a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
