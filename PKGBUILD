# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.12.5
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
source=("specify_cli-0.12.5-py3-none-any.whl::https://files.pythonhosted.org/packages/14/9f/88824e799492f1e1a30326fcb65f96eb915b399fd254005f82140603fee4/specify_cli-0.12.5-py3-none-any.whl")
sha256sums=('7759cdbd43484165eb35f6b61d58cca3b6ef5791665505f61fd8244f24b50cd6')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
