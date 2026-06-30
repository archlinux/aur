# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.12.0
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
source=("specify_cli-0.12.0-py3-none-any.whl::https://files.pythonhosted.org/packages/8e/be/6d0b4f2c7a7edc1a964fe24b375357bd02aefb684e2e5650437c4e50d158/specify_cli-0.12.0-py3-none-any.whl")
sha256sums=('7a037abe90e360aa9c9c2690526023f4affed73782f85dfa1c49c7b38f565762')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
