pkgname='python-revtok'
_module='revtok'
_src_folder='revtok-0.0.3'
pkgver='0.0.3'
pkgrel=1
pkgdesc="Reversible tokenization in Python."
url="https://github.com/jekbradbury/revtok"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/ea/a4/03688e46ea35e100fcb406bf59ef5b682317acc9c892e8ffbad13b0c51c3/revtok-0.0.3.tar.gz")
sha256sums=('b068055907eb3c9b2b4202e6839f51c9b9e9e16c9267a392c06a326d25bd6287')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
