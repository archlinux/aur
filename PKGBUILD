# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=markora
pkgver=1.0.0
pkgrel=1
pkgdesc="Sovereign Markor-style Markdown Notebook, QuickNotes & Todo TUI for Terminal Power Users"
arch=('any')
url="https://github.com/zyekhabdul/markora"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-gkeepapi: Google Keep bi-directional sync'
    'python-playwright: Automated browser login for Google Keep'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da1341d812e50abc080b86ce26e033b972543777904183acd2567edc7e1175e3')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
