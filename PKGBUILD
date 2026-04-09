# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm
pkgver=0.2.1
pkgrel=1
pkgdesc="Local documentation retrieval service for agent-assisted development"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=(
    'python'
    'python-fastapi'
    'uvicorn'
    'python-chromadb'
    'python-gitpython'
    'python-httpx'
    'python-click'
    'python-rich'
    'python-yaml'
    'python-html2text'
    'python-beautifulsoup4'
    'python-lxml'
    'python-markdownify'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm-bin' 'python-agent-rtfm-git')
source=("https://pypi.io/packages/source/a/agent-rtfm/agent_rtfm-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "agent_rtfm-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "agent_rtfm-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/agent_rtfm-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
