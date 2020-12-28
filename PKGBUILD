# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-pydevto'
pkgname=('python-pydevto')
_module='pydevto'
pkgver='0.1.5'
pkgrel=1
pkgdesc="Unofficial dev.to api for python"
url="https://github.com/lpellis/pydevto"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('91137b0ccaf18af0897029151a09da0240bc65d7c17c240b77df75b8bcf2cb3c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-pydevto/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
