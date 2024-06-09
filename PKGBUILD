# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.75.0
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
  "https://files.pythonhosted.org/packages/23/45/780844c01ae42eb57b738ddb7b4f33fa3e070741f67ee430cd62e03f4b80/semgrep-1.75.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl"
)
sha256sums=('05d1467903e9c5e60fa312535a647acc427eb641ae3a01c9aca66a6a4ba7e6a7')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.75.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl
  python -O -m compileall "${pkgdir}"
}

