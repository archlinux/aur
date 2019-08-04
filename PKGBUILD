pkgbase='python-omemo'
pkgname=('python-omemo')
_module='OMEMO'
pkgver='0.10.5'
pkgrel=1
pkgdesc="A Python implementation of the OMEMO Multi-End Message and Object Encryption protocol."
url="https://github.com/Syndace/python-omemo"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a6e091d9e5300725cf91cbe787b1f23e6b5b72be46e4ac749491bba8f91c6746')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
