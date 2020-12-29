# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-stop-words'
pkgname=('python-stop-words')
_module='stop-words'
pkgver='2018.7.23'
pkgrel=1
pkgdesc="Get list of common stop words in various languages in Python"
url="https://github.com/Alir3z4/python-stop-words"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6df3ad5f5de697daa437e4445c86c73604e6bc138dd0dc0fac55664aa4e6b03e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-stop-words/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
