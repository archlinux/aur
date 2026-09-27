# Maintainer: Balasubramanian Periannan <balathepharmacist@gmail.com>
pkgname=lixplore-cli
pkgver=1.2.3
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
sha256sums=('6159d728caa1b9c91161d52157d3868742ebf602f009c7be3792e600c1bbe2f5')

build() {
    cd "Lixplore_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Lixplore_cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
