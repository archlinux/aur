# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=0.13.2
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
source=("specify_cli-0.13.2-py3-none-any.whl::https://files.pythonhosted.org/packages/c3/ed/679a0a37e1e6a49006b81fd06c14b60104a330088d27640c66ba97fa710e/specify_cli-0.13.2-py3-none-any.whl")
sha256sums=('0c0a4947c660158ee140a10814d6feb57faa5a0fd0ef74f1873306af42ae6b35')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
