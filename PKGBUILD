# Maintainer: Balasubramanian Periannan <balathepharmacist@gmail.com>
pkgname=lixplore-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Academic Literature Search & Export CLI Tool - Search PubMed, arXiv, Crossref, DOAJ, EuropePMC"
arch=('any')
url="https://github.com/pryndor/Lixplore_cli"
license=('MIT')
depends=(
    'python'
    'python-biopython'
    'python-requests'
    'python-openpyxl'
)
optdepends=(
    'python-textual: Full-screen TUI (lixplore --tui)'
    'python-rich: Colored output and fallback TUI'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pryndor/Lixplore_cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b76bf31d218d01c05e2b0db4241be1ea9b46c5b85a50129adafd2cbf885d27a0')

build() {
    cd "Lixplore_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Lixplore_cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
