# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=(
    'python>=3.11'
    'python-fastapi'
    'uvicorn'
    'python-chromadb-bin'
    'python-onnxruntime-cpu'
    'python-gitpython'
    'python-httpx'
    'python-click'
    'python-rich'
    'python-pyyaml'
    'python-html2text'
    'python-beautifulsoup4'
    'python-lxml'
    'python-markdownify'
)
makedepends=('python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
install=python-agent-rtfm-bin.install
_wheel="agent_rtfm-0.2.0${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/a/agent_rtfm/${_wheel}")
sha256sums=('SKIP')
noextract=("${_wheel}")

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
