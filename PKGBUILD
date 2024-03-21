# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.66.0
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
  "https://files.pythonhosted.org/packages/58/da/d1d4681d8e73b7b27223822281c915b672914b0713248378aa7045e110d5/semgrep-1.66.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl"
)
sha256sums=('3d1fe1e22edc9ba8a6ea45fd9c9a253703b39c13fd6a300438f0011770c0d2c9')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.66.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl
  python -O -m compileall "${pkgdir}"
}
