# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.84.0
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
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-opentelemetry-api'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=('semgrep')
options=('!strip')
source=("https://files.pythonhosted.org/packages/ee/6f/f88f9e7ebc4241001a4589572ac3314a75eb02b3513c6c24bd59991920a8/semgrep-1.84.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl")
sha256sums=('2ed910c1f1198860927ce245e94e8cc8e89af02275264647f52ac739243ee6bd')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.84.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl
  python -O -m compileall "${pkgdir}"
}

