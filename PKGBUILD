pkgname=omazed
pkgver=2.2.0
pkgrel=1
pkgdesc="Live theme switching for Zed in Omarchy - automatically synchronize your Zed editor theme with your Omarchy system theme"
arch=('any')
url="https://github.com/aps6/omazed"
license=('MIT')
depends=('bash' 'jq')
makedepends=('git')
backup=()
install=omazed.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/aps6/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5461f819c039be9f8150ffc1f8045589eda41ce711f95afa961e845b4d28ba02')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main scripts
    install -Dm755 omazed "$pkgdir/usr/bin/omazed"
    install -Dm755 omazed-generator.sh "$pkgdir/usr/bin/omazed-generator.sh"
    install -Dm644 omazed-theme.tpl "$pkgdir/usr/bin/omazed-theme.tpl"
    install -Dm755 omazed-font.sh "$pkgdir/usr/bin/omazed-font.sh"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
