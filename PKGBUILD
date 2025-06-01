# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-conllu'
pkgname=('python-conllu')
_module='conllu'
pkgver='6.0.0'
pkgrel=1
pkgdesc="CoNLL-U Parser parses a CoNLL-U formatted string into a nested python dictionary"
url="https://github.com/EmilStenstrom/conllu/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('bc6072d49d00e77f4454039519118c0500fafa0d0eb509f53793081084f50aba')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
