# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.11.8
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
source=("specify_cli-0.11.8-py3-none-any.whl::https://files.pythonhosted.org/packages/9b/db/f0ffcdb512c081247f7d959bcd19b686979ad92c4f8696174ef249938095/specify_cli-0.11.8-py3-none-any.whl")
sha256sums=('ce858e2d0c169d1a7aacaedc2e743983c77edb90d1dbef9e686d622e3e03149b')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
