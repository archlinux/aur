# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="Specify CLI, part of GitHub Spec Kit — bootstrap projects for Spec-Driven Development (SDD)"
arch=('any')
url="https://github.com/github/spec-kit"
license=('MIT')
depends=(
  'python'
  'python-typer'
  'python-click'
  'python-rich'
  'python-platformdirs'
  'python-readchar'     # AUR
  'python-yaml'
  'python-packaging'
  'python-pathspec'
  'python-json5'
)
makedepends=('python-installer')
provides=('specify-cli')
conflicts=('specify-cli')
source=("specify_cli-1.2.5-py3-none-any.whl::https://files.pythonhosted.org/packages/58/33/55f4da31d9c62060a8103f91e75b664ed13298abf0f158fb8c2fb0a49ff5/specify_cli-1.2.5-py3-none-any.whl")
sha256sums=('b909bb0e9848c5b2f8be5323921d541310c804f7672ce79d01bb7227fd7f3a70')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
