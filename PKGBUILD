# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.11.3
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
source=("specify_cli-0.11.3-py3-none-any.whl::https://files.pythonhosted.org/packages/46/a8/59d00590d904e2b0b5b987f32de2e2a204613ef507b5209f7072383a9fe9/specify_cli-0.11.3-py3-none-any.whl")
sha256sums=('6d93d0074f77b8ab3dcf280927407ff8f5a06b0adc3db65de6b83062df5b1bf4')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
