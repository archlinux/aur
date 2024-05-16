# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-sklearn-crfsuite'
_proj_name="${pkgname#python-}"
pkgver='0.3.6'
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
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
sha256sums=('2f59aad3055e01a778a79a6352891cac04788e8b52688aa5bc8b11be7717861e')
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
