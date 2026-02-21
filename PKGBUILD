# Maintainer: SPTApyo <laroussinabil.311@gmail.com>
pkgname=stratos-cli
pkgver=0.1
pkgrel=1
pkgdesc="Multi-Agent Autonomous Coding System for Terminal"
arch=('any')
url="https://github.com/SPTApyo/stratos-cli"
license=('MIT')
depends=('python>=3.10' 'python-rich' 'python-dotenv' 'python-readchar' 'python-google-generativeai' 'python-duckduckgo-search')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/SPTApyo/stratos-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
cd "stratos-cli-${pkgver}"
python -m build --wheel --no-isolation
}

package() {
cd "stratos-cli-${pkgver}"
python -m installer --destdir="${pkgdir}" dist/*.whl
}
