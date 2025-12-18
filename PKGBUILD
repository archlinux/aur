# Maintainer: Leonardo Alanis <leogabac@users.noreply.github.com>

pkgname=gremux
pkgver=0.1.1
pkgrel=1
pkgdesc="Declarative tmux session manager"
arch=('any')
url="https://github.com/leogabac/gremux"
license=('GPL2')
depends=(
  'python'
  'python-libtmux'
  'python-pyyaml'
  'tmux'
  'fzf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=(
  "https://files.pythonhosted.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
