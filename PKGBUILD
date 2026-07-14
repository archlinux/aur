# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=0.12.14
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
source=("specify_cli-0.12.14-py3-none-any.whl::https://files.pythonhosted.org/packages/d3/4f/bb67aa6a5b4c688d33c4f6d53d69be9b267d40737ffb9a2661c7ef6a94ca/specify_cli-0.12.14-py3-none-any.whl")
sha256sums=('dee47c1afb21182b64bff92147d78e1d0b3f2b9973106fa457d80d35248d9445')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
