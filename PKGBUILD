# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.10.1
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
source=("specify_cli-0.10.1-py3-none-any.whl::https://files.pythonhosted.org/packages/bf/d6/9f4043944ed9401efe200431c709bf13ee87369d1526146ff0d617f18a14/specify_cli-0.10.1-py3-none-any.whl")
sha256sums=('76d6cc4102ec7810bf5cd2330380bcc5b117e9a000b9d11901eea033c09c9cd1')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
