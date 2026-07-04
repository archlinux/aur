# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=llama-index
pkgname=python-${_name}
pkgver=0.14.23
pkgrel=1
pkgdesc="Interface between LLMs and your data"
arch=('any')
url="https://github.com/run-llama/llama_index"
license=('MIT')
depends=('python' 'python-llama-index-core' 'python-llama-index-embeddings-openai' 'python-llama-index-llms-openai' 'python-nltk')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('eac2049816a7410ff4568490cce4bdff99cda3ab99d59f52f6227dad22cda44b')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
