# Maintainer: username227
# Maintainer: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.113.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL-2.1-only)
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
source=("https://files.pythonhosted.org/packages/e9/8a/e37113e5a6a5fa0913e8370ade1dbfe91a323be77eb3764c227a83bdcfb6/semgrep-1.113.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl")
sha256sums=('bc6e8b9727825c45316143b05688ed282c9c2ed0d7e08734e0f18e3945b7fb02')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.113.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl
  python -O -m compileall "${pkgdir}"
}
