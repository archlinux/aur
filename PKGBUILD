# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io

pkgname=oget
pkgver=1.0.1
pkgrel=1
pkgdesc="Ollama Model Direct Downloader & Installer - get direct links and install models offline"
arch=('any')
url="https://github.com/fr0stb1rd/oget"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/o/oget/oget-${pkgver}.tar.gz")
sha512sums=('db21b537bf5285e0f4a3da7d293fe321d319546428469f91bf0e16b25419ae6eef10d5ed9912f61f20259095368600c803d7822b86e1f0e94df68d2d38ed5da3')

build() {
    cd "oget-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "oget-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
