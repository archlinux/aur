# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=google-colab-cli
_pkgname=google_colab_cli
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI for interacting with Google Colab"
arch=('any')
url="https://github.com/googlecolab/google-colab-cli"
license=('Apache-2.0')
depends=('python'
         'python-click'
         'python-filelock'
         'python-google-auth'
         'python-google-auth-oauthlib'
         'python-html2text'
         'python-jupyter-kernel-client'
         'jupyter-nbformat'
         'python-packaging'
         'python-prompt_toolkit'
         'python-pydantic'
         'python-pygments'
         'python-requests'
         'python-rich'
         'python-typer'
         'python-typing_extensions'
         'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/g/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('98adc2e200df421a0cdbb4d85bc705ed4e5d8c16892b584992ddfeac74625aca')

build() {
  cd "$_pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
