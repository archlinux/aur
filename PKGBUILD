# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

pkgname=instagram-cli
pkgver=1.4.2
pkgrel=2
pkgdesc="Instagram's terminal UI app - The ultimate weapon against brainrot"
arch=('any')
url="https://github.com/supreme-gg-gg/instagram-cli"
license=('MIT')
depends=('nodejs>=20')
makedepends=('nodejs>=20')
source=("https://registry.npmjs.org/@i7m/instagram-cli/-/instagram-cli-$pkgver.tgz")
sha256sums=('e3d7eaf0e11cd6567e761ab88b6cb50e31e820e93e92b8a485cf8c68ed561eb2')

prepare() {
    cd "$srcdir/package"
    env npm install
}

package() {
    install -d "$pkgdir/usr/lib/$pkgname"
    mv "$srcdir/package/"* "$pkgdir/usr/lib/$pkgname/"

    cd "$pkgdir/usr/lib/$pkgname"
    mkdir -p "$pkgdir/usr/bin"

    bin="/usr/lib/$pkgname/dist/cli.js"

    ln -s "$bin" "$pkgdir/usr/bin/$pkgname"

    chmod +x "$pkgdir/$bin"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
