# Maintainer: Atte Lautanala <atte@lautana.la>

pkgname=python-poetry-plugin-dotenv
_pkgname=poetry_plugin_dotenv
pkgver=2.1.4
pkgrel=1
pkgdesc='Automatically loads a dotenv file before poetry commands'
arch=(any)
url="https://github.com/volopivoshenko/poetry-plugin-dotenv"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('2189fbe44c9a5e052276c8a713e966197aab39e5d5ffccac81e0621339f0702bc9c06e310ee65dfa7d49b596873697aaf2567d9bd2309a4f16438ade4c7ba7fa')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
