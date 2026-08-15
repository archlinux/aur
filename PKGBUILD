pkgname=omazed
pkgver=2.1.0
pkgrel=1
pkgdesc="Live theme switching for Zed in Omarchy - automatically synchronize your Zed editor theme with your Omarchy system theme"
arch=('any')
url="https://github.com/aps6/omazed"
license=('MIT')
depends=('bash')
makedepends=('git')
backup=()
install=omazed.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/aps6/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a4f712ff6598a01970479f7e8d40f2e46983f0ea66e3ff499c62d8ff39cc03b')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main scripts
    install -Dm755 omazed "$pkgdir/usr/bin/omazed"
    install -Dm755 omazed-generator.sh "$pkgdir/usr/bin/omazed-generator.sh"
    install -Dm644 omazed-theme.tpl "$pkgdir/usr/bin/omazed-theme.tpl"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
