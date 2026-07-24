# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=0.14.1
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
source=("specify_cli-0.14.1-py3-none-any.whl::https://files.pythonhosted.org/packages/aa/b6/3b17a358c000fab877c760d29a00f59c806931853388d8215f1235594f02/specify_cli-0.14.1-py3-none-any.whl")
sha256sums=('a6226d66e9db2b1dd1f70d0dce6b03fde44b67ae2a8167d58604611595c2cf55')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
