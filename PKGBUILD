# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-conllu'
pkgname=('python-conllu')
_module='conllu'
pkgver='4.3'
pkgrel=1
pkgdesc="CoNLL-U Parser parses a CoNLL-U formatted string into a nested python dictionary"
url="https://github.com/EmilStenstrom/conllu/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('35b5b76280507977e9e86f18369a1a4e5d4075a3680f1e9b2fac7ed5d0aaf427')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
