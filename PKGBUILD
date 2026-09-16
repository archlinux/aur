# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=1.0.7
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
source=("specify_cli-1.0.7-py3-none-any.whl::https://files.pythonhosted.org/packages/20/b4/77ec0faa3df4e339d5ac4ae38fc9a3b15f1df39ab251c7e5a83e116bd807/specify_cli-1.0.7-py3-none-any.whl")
sha256sums=('6b316e443995c147c0460621280f609516d5dc7d4af8054665a1f8b9b7999fd1')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
