# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-khmer-nltk'
_proj_name="${pkgname#python-}"
pkgver='1.6'
pkgrel=1
pkgdesc='A Khmer language processing toolkit'
arch=(any)
url='https://github.com/VietHoang1512/khmer-nltk'
license=('Apache-2.0')
depends=(
  'python-tqdm'
  'python-sklearn-crfsuite'
  'python>=3.6')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
sha256sums=('4ecfa4ddef8f88cde63b9f0d7f5544bb8389b3bb87a835f37ae7f6a2a9e3fd57')
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
