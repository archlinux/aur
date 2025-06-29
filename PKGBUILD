pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=()
makedepends=('python' 'pyinstaller')
source=("dotpusher.zip::https://github.com/maarutan/dotpusher/archive/refs/tags/v$pkgver.zip")
sha256sums=('a328234aa9a959ccc1a78b004ab76beff1395e046e3b9acb2a7e77e7c07971dc')

options=(!debug)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    pyinstaller --onefile --name=dotpusher main.py
}

package() {
    cd "$srcdir/dotpusher-$pkgver"
    install -Dm755 "dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

