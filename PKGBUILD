# Maintainer: Balasubramanian Periannan <balathepharmacist@gmail.com>
pkgname=lixplore-cli
pkgver=1.1.0
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
    'python-rich: Enhanced TUI mode with colors and formatting'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pryndor/Lixplore_cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d83cae62e6577130e1bfc2a3d8a78216c3e18dfb9064e9151f438a749e4622fb')

build() {
    cd "Lixplore_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Lixplore_cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
