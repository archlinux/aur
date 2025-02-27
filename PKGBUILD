# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.110.0
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
source=("https://files.pythonhosted.org/packages/ba/7b/6328e9a3cb7cbf6a8c648ac1929d56125b7c48a417fbc0ebfcc37669bd78/semgrep-1.110.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl")
sha256sums=('c32930df55f0ffc86d74cced771d3f91cc1a6ca94e8bd2d6563f22a63d6b0bdd')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.110.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl
  python -O -m compileall "${pkgdir}"
}
