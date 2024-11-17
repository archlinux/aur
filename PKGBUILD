pkgname='python-csiread'
_module='csiread'
_src_folder='csiread-1.4.1'
pkgver='1.4.1'
pkgrel=1
pkgdesc="A **fast** channel state information parser for Intel, Atheros, Nexmon, ESP32 and PicoScenes in Python."
url="https://github.com/citysu/csiread"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/08/4c/94f9d0d788548e6fffbed0491ea7dbc1e83864491e37101c1a2d7cdc9ef4/csiread-1.4.1.tar.gz")
sha256sums=('5159c81d160c4fa581acc58944bf29d34d712f40721469125a8573bd0f5bbcb7')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
