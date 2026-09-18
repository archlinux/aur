# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-$_name
pkgver=2.7.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url="https://github.com/gradio-app/gradio/tree/main/client/python"
license=('Apache-2.0')
depends=('python' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-discord: Chat with discord bot')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2c629110496dbca67a848cd70add8cf5c3a24776404a2c5ef4fd759c7c2c33c4')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation

}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
