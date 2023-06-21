# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.27.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch'
)
optdepends=(
  'jsonnet: experimental jsonnet support'
)
provides=('semgrep')
options=('!strip')
source=(
  "https://files.pythonhosted.org/packages/09/8f/2b2821959bcbd4c4dae10c85d74e28f1a3cb894d80dc9cc1205dd91f52a3/semgrep-1.27.0-cp37.cp38.cp39.py37.py38.py39-none-any.whl"
)
sha256sums=(
  '7118fcd5d5e9004e92d045da8ec46290e2003f39547f8d858620c25a3bfec194'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
