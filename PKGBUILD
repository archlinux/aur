pkgname='python-simplemma'
_module='simplemma'
_src_folder='simplemma-1.1.2'
pkgver='1.1.2'
pkgrel=1
pkgdesc="A lightweight toolkit for multilingual lemmatization and language detection."
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/16/58/81fc31ae8a83a2c422ca51784825b8b2d1ebdf068e351d364fedd9707307/simplemma-1.1.2.tar.gz")
sha256sums=('8549eefc288b25262c38027ef09f2db28ee0355b2a0cc62c1a8abbe948ef72bd')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
