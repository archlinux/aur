# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.10.0
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
source=("specify_cli-0.10.0-py3-none-any.whl::https://files.pythonhosted.org/packages/31/a7/5209da61593544d31f646a2cbf79dcfd01b8f26ecbd38eeca62e562c7bd1/specify_cli-0.10.0-py3-none-any.whl")
sha256sums=('cb3c0161bc4a9dc2ef1361ce79054fc8d585bd45613ee65383944845afc10a7d')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
