# Maintainer: git-commit <snowdragon92[at]gmail.com>

pkgname=tailor
pkgver="0.12.0"
pkgrel=1
pkgdesc="Cross-platform static analyzer and linter for Swift"
arch=("x86_64")
url="https://tailor.sh/"
license=('MIT')
depends=("java-runtime=8")
makedepends=()
optdepends=()
source=("https://github.com/sleekbyte/tailor/releases/download/v$pkgver/$pkgname-$pkgver.tar")
install=()
sha256sums=('ec3810b27e9a35ecdf3a21987f17cad86918240d773172264e9abbb1a7efc415')

package() {
    cd "$srcdir"
    ls

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1/"

    install -m755 -d "$pkgdir/usr/share/tailor"
    cp -R ${srcdir}/${pkgname}-${pkgver}/* "$pkgdir/usr/share/tailor"
    ln -s /usr/share/tailor/bin/tailor "$pkgdir/usr/bin/tailor"
    ln -s /usr/share/tailor/tailor.1 "$pkgdir/usr/share/man/man1/tailor.1"
}
