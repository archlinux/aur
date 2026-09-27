# Maintainer: Balasubramanian Periannan <balathepharmacist@gmail.com>
pkgname=lixplore-cli
pkgver=1.2.1
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
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pryndor/Lixplore_cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8a926351f0391471ac07b11f9b5a08dd7db3571ca5d13d2db5113c345040189')

build() {
    cd "Lixplore_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Lixplore_cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
