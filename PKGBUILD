# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=1.0.9
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
source=("specify_cli-1.0.9-py3-none-any.whl::https://files.pythonhosted.org/packages/f0/a2/939c11b703ebef2d20917f66d1e5becc6340e567a56572b16f47a55903a8/specify_cli-1.0.9-py3-none-any.whl")
sha256sums=('1f6c6f1ae10c35187cb35ac4bf526ea6ca032e00b8e44e6ca19c93e5c71520ce')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
