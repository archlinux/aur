# Maintainer: Atte Lautanala <atte@lautana.la>

pkgname=python-poetry-plugin-dotenv
_pkgname=poetry_plugin_dotenv
pkgver=2.5.1
pkgrel=1
pkgdesc='Automatically loads a dotenv file before poetry commands'
arch=(any)
url="https://github.com/volopivoshenko/poetry-plugin-dotenv"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('18675ddc4ac995ec16416842ead55e3d68f76b55c5a37f6847ec39cfe4b365aa9d520a227e3177bc1f31ed93400b2a8756c7297f382939c35794b7a51b55972d')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
