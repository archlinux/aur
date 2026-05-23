# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langchain-protocol
pkgname=python-$_name
pkgver=0.0.15
pkgrel=1
pkgdesc="Python bindings for the LangChain agent streaming protocol."
arch=('any')
url="https://github.com/langchain-ai/agent-protocol/tree/main/streaming/py"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9ab2d11ee73944754f10e037e717098d3a6796f0e58afa9cadda6154e7655ade')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
