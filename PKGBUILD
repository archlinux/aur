# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.21.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-setuptools' 'python-wheel')
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
  "https://files.pythonhosted.org/packages/56/56/6e4c142a84f7c85dd8d6cd75608519b6dedda279e5926060496bc5a2b1a3/semgrep-1.21.0-cp37.cp38.cp39.py37.py38.py39-none-any.whl"
)
sha256sums=(
  '01b543856062cef221d7a8c133a7e791dcc32ff94e60d95a1477fef08392f081'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
