# Maintainer: Evert Vorster <superchief@evertvorster.com>
pkgname=python-openmemory
_pypiname=openmemory_py
pkgver=1.0.2
pkgrel=2
pkgdesc="Local-first long-term memory engine for AI apps and agents (Python SDK)"
arch=('any')
url="https://github.com/CaviraOSS/OpenMemory"
license=('Apache-2.0')
depends=(
  'python'
  'python-dotenv'
  'python-openai'
  'python-numpy'
  'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/o/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('8ee46dffc86df3fabad8e84a684fe9a230418a350d71806d939ba62afb6c1c5b')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
