# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Richard Neumann aka. schard <mail at richard dash neumann period de>

_modulename='mimeutil'
pkgname="python-${_modulename}"
pkgver=1.0.4
pkgrel=1
pkgdesc='Python MIME type and file extension detection library'
arch=('any')
url="https://pypi.org/project/${_modulename}"
_repourl="https://github.com/homeinfogmbh/${_modulename}"
license=('GPL3')
depends=(
  'python'
  'python-magic'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
source=("${pkgname}::git+${_repourl}.git#tag=${pkgver}")
b2sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
