# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-$_name
pkgver=2.5.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url="https://github.com/gradio-app/gradio/tree/main/client/python"
license=('Apache-2.0')
depends=('python' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-discord: Chat with discord bot')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4cde99bad62149595c30c90876ca2e405e3a13687ecf895474f3412cb476673d')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation

}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
