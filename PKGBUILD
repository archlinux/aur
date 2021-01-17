pkgbase='python-probat'
pkgname=('python-probat')
_module='probat'
pkgver=1.0.2
pkgrel=1
pkgdesc="Battery life saver and reminder"
url="https://github.com/codeswhite/probat"
depends=('python' 'python-termcolor')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("c6a63ebf9214b199320ae6659801aa13b1840a8e5116f43c27f6321cbd61a614")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
