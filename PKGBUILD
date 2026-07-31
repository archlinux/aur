pkgname='python-httpstat'
pkgver='2.0.0'
_module='httpstat'
_src_folder="${_module}-${pkgver}"
pkgrel=1
pkgdesc="curl statistics made simple"
url="https://github.com/reorx/httpstat"
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/7d/7d/436692f99eb01c0af46aa6019a9d3f0977894e373334abb044f9a8721991/${_module}-${pkgver}.tar.gz")
sha256sums=('9fa2930aebadefabb301daff56962003f26a973dc3f114743fd509909c77a638')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
