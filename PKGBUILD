pkgbase='python-mpl-interactions'
pkgname=('python-mpl-interactions')
_module='mpl_interactions'
pkgver='0.22.2'
pkgrel=1
pkgdesc="Matplotlib aware interact functions"
url=""
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f7fa1fe07d44817a0a23b2aec48ecf019e57a3aba7a2a8315a37b671f4e9215a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
