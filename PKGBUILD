# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io

pkgname=oget
pkgver=1.0.0
pkgrel=1
pkgdesc="Ollama Model Direct Downloader & Installer — get direct links and install models offline"
arch=('any')
url="https://github.com/fr0stb1rd/oget"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/o/oget/oget-${pkgver}.tar.gz")
sha256sums=('eb9c66d6c43c315386bb55ce11b88d782882585e25d081c5550fd000f5e9848e')

build() {
    cd "oget-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "oget-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
