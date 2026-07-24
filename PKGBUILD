# Maintainer: Zmole Cristian <tragdate@gmail.com>
pkgname=getlyricsmcp-bin
_realname=getlyricsmcp
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server that finds and fetches song lyrics. No API keys — it guesses each site's URL from artist+title. (prebuilt)"
arch=('x86_64')
url="https://github.com/ZmoleCristian/getlyricsmcp"
license=('0BSD')
depends=('gcc-libs')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
install="$_realname.install"
source=("$_realname-$pkgver-${CARCH}.tar.gz::https://github.com/ZmoleCristian/getlyricsmcp/releases/download/v$pkgver/getlyricsmcp-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('46752b83c17b32d3abb2688fd68919bb1cf7ac906e012636c0bfda116db02609')

package() {
    cd "getlyricsmcp-${CARCH}-unknown-linux-gnu"
    install -Dm755 "$_realname" "$pkgdir/usr/bin/$_realname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_realname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_realname/README.md"

    if [ -f "man/$_realname.1" ]; then
        install -Dm644 "man/$_realname.1" "$pkgdir/usr/share/man/man1/$_realname.1"
    fi
}
