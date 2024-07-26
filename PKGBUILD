# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.81.0
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/16/b0/d0b15e7a8e61b7fe6b33ba2014bdc9a179bf744df872ae137466a40c3be0/semgrep-1.81.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl")
sha256sums=('32d711a5806843c036ca45095110b323622b16eee8d2d7cd02588f40030f85ea')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.81.0-cp38.cp39.cp310.cp311.py37.py38.py39.py310.py311-none-any.whl
  python -O -m compileall "${pkgdir}"
}

