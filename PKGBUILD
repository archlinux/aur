# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-sklearn-crfsuite'
_proj_name="${pkgname#python-}"
_proj_name="${_proj_name//-/_}"
pkgver='0.5.0'
pkgrel=1
pkgdesc='CRFsuite wrapper with similar to scikit-learn interface'
arch=(any)
url='https://github.com/TeamHG-Memex/sklearn-crfsuite'
license=('MIT')
depends=(
  'python-tqdm>=2.0'
  'python-six'
  'python-tabulate'
  'python-crfsuite>=0.8.3'
  'python')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/${_proj_name}/${_proj_name}-${pkgver}.tar.gz")
sha256sums=('136cb941ff5f7ce62a2c378988d1123ac1037241e73999ae404509a2135078e9')
_tardir="${_proj_name}-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  ls
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
