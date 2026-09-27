# Maintainer: Balasubramanian Periannan <balathepharmacist@gmail.com>
pkgname=lixplore-cli
pkgver=1.2.2
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
sha256sums=('96e5b7c13e76bce3070fee2c0bc9211dfb3b1f25b3710921bc483271f5d7b09c')

build() {
    cd "Lixplore_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Lixplore_cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
