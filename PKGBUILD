pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maarutan/dotpusher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f579072692fc0e0eaa64f3dcbe7feaca5bdecb682fb1f60d5d43816e31d3c41')

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

