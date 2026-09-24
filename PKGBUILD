# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=1.0.11
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
source=("specify_cli-1.0.11-py3-none-any.whl::https://files.pythonhosted.org/packages/c4/22/c944696202ee499528743b4c7d32c8beafcea4fba1afba672ffcd7edba90/specify_cli-1.0.11-py3-none-any.whl")
sha256sums=('e4ef58b30c91113b1bf05b3d9ceab79e8b6e48a818c6e1fc266e37757fb19630')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
