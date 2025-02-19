# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.109.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-opentelemetry-api'
  'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-instrumentation-requests'
  'python-opentelemetry-sdk'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=('semgrep')
options=('!strip')
source=("https://files.pythonhosted.org/packages/f1/60/6b65c79aae31133f344ee395c64127fd8b723c175b4a695552e668af8607/semgrep-1.109.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl")
sha256sums=('e0500daa096845b8258b79795c2b2bfde8ec4ea444a536357a947bc58bc59008')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps https://files.pythonhosted.org/packages/f1/60/6b65c79aae31133f344ee395c64127fd8b723c175b4a695552e668af8607/semgrep-1.109.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl
  python -O -m compileall "${pkgdir}"
}
