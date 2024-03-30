# Maintainer: Atte Lautanala <atte@lautana.la>

pkgname=python-poetry-plugin-dotenv
_pkgname=poetry_plugin_dotenv
pkgver=0.6.33
pkgrel=1
pkgdesc='Automatically loads a dotenv file before poetry commands'
arch=(any)
url="https://github.com/volopivoshenko/poetry-plugin-dotenv"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('991f9cc4947609023fb23b36a7be0a37ec53e23d01dfb63be72999790b1d51659aebbe9527349984b484cd03ef2d9459fa4e7a6e3e88363a56415485b6b9a5a8')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
