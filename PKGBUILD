# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.11.6
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
source=("specify_cli-0.11.6-py3-none-any.whl::https://files.pythonhosted.org/packages/8d/a6/e92ca77cf9261566a300c8ace85b69070771f37945e4f0d98d941b89d3f8/specify_cli-0.11.6-py3-none-any.whl")
sha256sums=('32bf6d10b6c0510c79b334e71206f3cf33552fc035ac4a2ac0d06b3823debd08')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
