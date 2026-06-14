# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=hf-gradio
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc='An extension of the Hugging Face CLI for interacting with Gradio Spaces and Apps.'
arch=('any')
url='https://github.com/gradio-app/hf-gradio'
license=('Apache-2.0')
depends=('python' 'python-typer' 'python-gradio-client')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a017d942618f0d495a58ee4563047fa04bef614c00e0cb789a9a6d0633cffa7b')

build() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
