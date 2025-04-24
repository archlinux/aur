# Maintainer: username227
# Maintainer: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=1.120.0
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
source=("https://files.pythonhosted.org/packages/97/54/44bdff0524371be47a3b476cd633f596b41a2f21b35de42332e0d807f0cf/semgrep-1.120.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl")
sha256sums=('91a66cb04eed24a0bb18abbc10b436e7c8d38e3db9694a85d9a9096678770e40')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps semgrep-1.120.0-cp39.cp310.cp311.py39.py310.py311-none-musllinux_1_0_x86_64.manylinux2014_x86_64.whl
  python -O -m compileall "${pkgdir}"
}
