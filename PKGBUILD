pkgbase='python-emoji'
pkgname=('python-emoji')
_module='emoji'
pkgver='0.5.4'
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('60652d3a2dcee5b8af8acb097c31776fb6d808027aeb7221830f72cdafefc174')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
