# Maintainer: Atte Lautanala <atte@lautana.la>

pkgname=python-poetry-plugin-dotenv
_pkgname=poetry_plugin_dotenv
pkgver=2.1.6
pkgrel=1
pkgdesc='Automatically loads a dotenv file before poetry commands'
arch=(any)
url="https://github.com/volopivoshenko/poetry-plugin-dotenv"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('f2b075ecb332e1fdf1a6fdedbb208ba2cc4ae1ebea6e170ca127d2e6db73bab01f9f904ad9f1071791cf6218a48705e4aec2afa3dc46118b35b9980d98731f3e')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
