# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-${_name}
pkgver=1.7.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=(any)
url='https://github.com/gradio-app/gradio/tree/main/client/python'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('6ecd3a537c6c076cb1b351c2d7ce5906070d2e1b3181163609bfa4a4c4f3040e')
depends=('python>=3.10' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions' 'python-websockets')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
