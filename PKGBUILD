# Maintainer: SPTApyo <laroussinabil.311@gmail.com>
pkgname=stratos-cli
pkgver=2.5.0
pkgrel=1
pkgdesc="Multi-Agent Autonomous Coding System for Terminal"
arch=('any')
url="https://github.com/SPTApyo/stratos"
license=('MIT')
depends=('python>=3.10' 'python-rich' 'python-dotenv' 'python-readchar' 'python-google-generativeai' 'python-duckduckgo-search')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/SPTApyo/stratos/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "stratos-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "stratos-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
