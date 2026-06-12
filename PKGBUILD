# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langchain-protocol
pkgname=python-$_name
pkgver=0.0.17
pkgrel=1
pkgdesc="Python bindings for the LangChain agent streaming protocol."
arch=('any')
url="https://github.com/langchain-ai/agent-protocol/tree/main/streaming/py"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e7cbe58c205df4b4fd87dc6d5bb23f10e13b236d0e2e1b0b9d05bc2b648f3eea')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
