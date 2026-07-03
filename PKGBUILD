# Maintainer: your-name <your-email>

pkgname=specify-cli-bin
pkgver=0.12.4
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
source=("specify_cli-0.12.4-py3-none-any.whl::https://files.pythonhosted.org/packages/ba/ee/41a1369089962eb11dfe1bebee84d838fa096c44ace3be50a6a23031ded9/specify_cli-0.12.4-py3-none-any.whl")
sha256sums=('c1f9d719cef44ddefdbd14eaee7f2b06145877e74f226beb525b4bd03c5728cd')

package() {
  cd "$srcdir"

  # Install wheel using python-installer (no dependency pulling)
  python -m installer \
    --destdir="$pkgdir" \
    --prefix=/usr \
    "specify_cli-${pkgver}-py3-none-any.whl"
}
