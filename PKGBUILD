# Maintainer: coffee <coffee@coffeecat.top>

pkgname=specify-cli-bin
pkgver=1.4.2
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
source=("specify_cli-1.4.2-py3-none-any.whl::https://files.pythonhosted.org/packages/50/1d/c245920409dd86fe9adf69e45104c3043d19f66b43dfe11fbbe5fdfef5ef/specify_cli-1.4.2-py3-none-any.whl")
sha256sums=('29e13231cb6b401205f979ec26ca10a3748f537fce76eb9437d877e19e23647d')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
