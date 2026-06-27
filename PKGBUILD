# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.11.9
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
source=("specify_cli-0.11.9-py3-none-any.whl::https://files.pythonhosted.org/packages/a2/a1/a42fdf6881a5c743e0b17b99d0d81ea16bb46877c45c3a0a4c571e50aa10/specify_cli-0.11.9-py3-none-any.whl")
sha256sums=('4b4b3f893ec5c846165774a1027669f71191dbe9b8e12bf4f6410d759de916d1')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
