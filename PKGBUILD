# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.12.3
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
source=("specify_cli-0.12.3-py3-none-any.whl::https://files.pythonhosted.org/packages/4a/75/fbdfc8334e8e69f730002611d0680285ea59d413dfe28ed7ca597829edac/specify_cli-0.12.3-py3-none-any.whl")
sha256sums=('793cc0a8b8546aea4ea40187b8550656d6681561943615593e29f22dbfe3b6e7')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
