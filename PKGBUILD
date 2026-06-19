# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.11.2
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
source=("specify_cli-0.11.2-py3-none-any.whl::https://files.pythonhosted.org/packages/8b/70/b07a44074e36f0a5740744dcf556cce1276c6b264e4292c09349da18d1a6/specify_cli-0.11.2-py3-none-any.whl")
sha256sums=('48be73a58ece2d95fc5bf429a838b9f6d27e45bffe8e65dfae7de106e82a4eb9')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
