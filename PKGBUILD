pkgname='python-pymorphy3'
_module='pymorphy3'
_src_folder='pymorphy3-2.0.2'
pkgver='2.0.2'
pkgrel=1
pkgdesc="Morphological analyzer (POS tagger + inflection engine) for Russian language."
url="https://github.com/no-plagiarism/pymorphy3"
depends=('python' 'python-dawg-python' 'python-pymorphy3-dicts-ru')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/df/fd/d9f54e7053986ebfa1ef0b7aff831b51a2c5e0144285c46c7664f2b7b470/pymorphy3-2.0.2.tar.gz")
sha256sums=('5192660028a0bfdf33ff19e827b73d6467dea32be87ad0faae9f2425e40d701c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
