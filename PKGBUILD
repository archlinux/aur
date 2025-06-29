pkgname=dotpusher
pkgver=0.1.1
pkgrel=1
pkgdesc="Declarative dotfiles manager using Git and JSON state tracking"
arch=('x86_64')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=('python')
makedepends=('unzip')
source=("dotpusher.zip::https://github.com/maarutan/dotpusher/releases/download/v${pkgver}/dotpusher.zip")
sha256sums=('74a1b1bf2b7b46cda8fa851098bfa5b8e1700344f22d1ae4644a877170e05c38')

package() {
    cd "$srcdir" || exit

    unzip -o "dotpusher.zip" -d dotpusher || exit

    cd dotpusher || exit

    install -Dm755 index.py "$pkgdir/usr/bin/dotpusher"

    install -d "$pkgdir/usr/share/dotpusher"
    cp -r core modules "$pkgdir/usr/share/dotpusher/"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

