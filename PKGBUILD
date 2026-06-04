# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.8.8
pkgrel=1
pkgdesc="CLI and TUI for Nowledge Mem - AI memory management"
arch=('any')
url="https://mem.nowledge.co/docs/cli"
license=('MIT')
depends=('python>=3.11')
makedepends=('python-installer' 'python-build' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/n/nmem-cli/nmem_cli-${pkgver}.tar.gz")
sha256sums=('20db38bf0227b8e1045b8e75c4e8c0ce47cb3c8ed4fc4528dab277867c71b00a')

build() {
    cd "nmem_cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "nmem_cli-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
