# Maintainer: username227
# Maintainer: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.126.0
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
source=("https://files.pythonhosted.org/packages/c9/64/e94ef74cbaafea07b3d3d06b67cd40dd2f1d1be309ed0db23a9605c028b4/semgrep-1.126.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl")
sha256sums=('dbf19a85b8bcaf650d213d7b709e95b629f91bed8adbef5a8d4e77b1e09507bd')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-${pkgver}-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl
  python -O -m compileall "${pkgdir}"
}
