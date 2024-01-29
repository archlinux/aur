# Maintainer: Atte Lautanala <atte@lautana.la>

pkgname=python-poetry-plugin-dotenv
_pkgname=poetry_plugin_dotenv
pkgver=0.6.4
pkgrel=1
pkgdesc='Automatically loads a dotenv file before poetry commands'
arch=(any)
url="https://github.com/volopivoshenko/poetry-plugin-dotenv"
license=(MIT)
depends=(python python-cleo python-poetry)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('774c500e6c742e9167ef1c33dddf4ac70c734c69398e622e046f1ff3b85c2b80e509bc70b7e3a1a2d4141c68152eaa99312cfe236c7b451b2ee25cd0e252f856')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
