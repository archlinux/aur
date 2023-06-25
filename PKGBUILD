# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.28.0
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
  "https://files.pythonhosted.org/packages/cb/d8/1e3f1733998c7a2954df307527943629b892ed62415ba48982a5408f37b1/semgrep-1.28.0-cp37.cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl"
)
sha256sums=(
  '804695261b05257713f4e1846c8a31b7c8ae9a1664ec1dd368d68ee46989bb4e'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
