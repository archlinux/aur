# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-conllu'
pkgname=('python-conllu')
_module='conllu'
pkgver='4.5.2'
pkgrel=1
pkgdesc="CoNLL-U Parser parses a CoNLL-U formatted string into a nested python dictionary"
url="https://github.com/EmilStenstrom/conllu/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7c581c0d12fcdd546cbf69050063c37312de28dd3048c3f144ec5b851e71891c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
