# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.10.2
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
source=("specify_cli-0.10.2-py3-none-any.whl::https://files.pythonhosted.org/packages/fe/eb/f3b513fc15f0bf12caff3bb153bab1bc96918d7762b7164a8f36421dca5e/specify_cli-0.10.2-py3-none-any.whl")
sha256sums=('6f5c947ebd84f3ebe19bced853f3fce66e4e7118cad80a0df9386ebb4d9e65dc')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
