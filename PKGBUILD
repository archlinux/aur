pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')
source=("dotpusher.zip::https://github.com/maarutan/dotpusher/archive/refs/tags/v${pkgver}.zip")
sha256sums=('5b2fbac3d15381e037718299b1e093b872a3d805e4d459760e023396aa695c8b')

options=(!debug)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile --name=dotpusher main.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

