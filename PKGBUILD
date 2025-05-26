# Maintainer: sga013
pkgname='python-pptx2md'
_module='pptx2md'
_src_folder='pptx2md-2.0.6'
pkgver='2.0.6'
pkgrel=1
pkgdesc="A tool to convert Powerpoint pptx file into markdown."
url="https://github.com/ssine/pptx2md/"
depends=('python' 'python-numpy' 'python-pptx' 'python-scipy' 'python-rapidfuzz' 'python-pillow' 'python-pydantic' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('Apache License 2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/68/84/023bbef348a8af7efb4e6ce8ca0d70e04af9d2e97b976d7c8fdbb2bf1889/pptx2md-2.0.6.tar.gz")
sha256sums=('2adc052d9fb5e031b0760887eea931e7c78c208b7b2440b10468a3c2874b4e44')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
