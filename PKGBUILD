pkgname=dotpusher
pkgver=0.1.0
pkgrel=1
pkgdesc="Dotpusher is a declarative method for synchronizing local files or directories with remote ones using git."
arch=('any')
url="https://github.com/maarutan/dotpusher"
license=('MIT')
depends=('python')
makedepends=('pyinstaller')
source=("https://github.com/maarutan/dotpusher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/dotpusher-$pkgver"
    pyinstaller --onefile --name dotpusher main.py
}

package() {
    install -Dm755 "$srcdir/dotpusher-$pkgver/dist/dotpusher" "$pkgdir/usr/bin/dotpusher"
}

