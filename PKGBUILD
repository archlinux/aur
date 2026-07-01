# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.12.2
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
source=("specify_cli-0.12.2-py3-none-any.whl::https://files.pythonhosted.org/packages/4c/69/70921617a4ea20e7ca47b83ed1eee0d0a2f95f68e5ce751884ef99885120/specify_cli-0.12.2-py3-none-any.whl")
sha256sums=('15c797a8dc922a6e0f13204e242875b19e26ffb390d1381e2b3bab1f39e96dfb')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
