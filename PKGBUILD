# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=0.14.3
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
source=("specify_cli-0.14.3-py3-none-any.whl::https://files.pythonhosted.org/packages/b0/f2/5815f2c22e98b6b90e6a811199e9be4089a5f82be131816a1bca24199e69/specify_cli-0.14.3-py3-none-any.whl")
sha256sums=('3a25613c0b9257eeccce6ee8530a692eb84e90a2c6ec21a8fb23e45f89db0742')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
