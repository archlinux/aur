# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.9.4
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
source=("specify_cli-0.9.4-py3-none-any.whl::https://files.pythonhosted.org/packages/e9/7c/6a3a5de1f1a6daed60d688d31de46b0129ccde9fb83b706d56d2bdf820cb/specify_cli-0.9.4-py3-none-any.whl")
sha256sums=('ed4f53709e3cacc165c8e88564d794182b6048258374a192831bf49436c85186')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
