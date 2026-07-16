# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=0.12.16
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
source=("specify_cli-0.12.16-py3-none-any.whl::https://files.pythonhosted.org/packages/4c/bf/93aebbb66a053210ab40d1d82ead92b836c9aa727ed4f50e774573c9e5f1/specify_cli-0.12.16-py3-none-any.whl")
sha256sums=('5e024d0c3636dc8f473af192d748d1022f0d86d8c681a4fe75d1f39507e8b9c1')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
