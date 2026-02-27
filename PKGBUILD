# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io

pkgname=oget
pkgver=1.0.2
pkgrel=1
pkgdesc="Ollama Model Direct Downloader & Installer - get direct links and install models offline"
arch=('any')
url="https://github.com/fr0stb1rd/oget"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/o/oget/oget-${pkgver}.tar.gz")
sha512sums=('7b37f96afc2f4603aea4035ab201a8d73d40f80aac6650ba1fd095b8ab5016f29e43919012eaeaa50b928781b655919b47b8cd8912aceec327afbb0820c32e22')

build() {
    cd "oget-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "oget-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
