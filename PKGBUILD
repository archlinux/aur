# Maintainer: git-commit <snowdragon92[at]gmail.com>

pkgname=tailor
pkgver="0.9.1"
pkgrel=2
pkgdesc="Cross-platform static analyzer and linter for Swift"
arch=("x86_64")
url="https://tailor.sh/"
license=('MIT')
depends=("java-runtime=8")
makedepends=()
optdepends=()
source=("https://github.com/sleekbyte/tailor/releases/download/v$pkgver/$pkgname-$pkgver.tar")
install=()
sha256sums=("6dff0e5ce1badaaa4b3440332a06e9a883a9e81535fca5e84f4e6e04eab1f1e7")

package() {
    cd "$srcdir"
    ls

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1/"

    install -m755 -d "$pkgdir/usr/share/tailor"
    cp -R ${srcdir}/${pkgname}-${pkgver}/* "$pkgdir/usr/share/tailor"
    ln -s /usr/share/tailor/bin/tailor "$pkgdir/usr/bin/tailor"
    ln -s /usr/share/tailor/tailor.1 "$pkgdir/usr/share/man/man1/tailor.1"
}
