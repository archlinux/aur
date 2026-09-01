# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search-bin
_pkgname=claude-conversation-search
pkgver=1.6.0
pkgrel=1
pkgdesc="CLI + MCP tool for searching Claude Code conversation history with Tantivy/BM25"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/claude-conversation-search-mcp"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz"
        "$_pkgname-$pkgver.tar.xz.asc::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz.asc")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64"
               "$_pkgname-$pkgver-x86_64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.asc")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64"
                "$_pkgname-$pkgver-aarch64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.asc")
sha256sums=('940bfde144ad0d300fd042e9c1e1f2f85bc385e012bfc5fe65cf4e8cbf083a88'
            'SKIP')
sha256sums_x86_64=('f622cf4ca6cf3173927d922c933beee37ca2404e022fbfeeefad96685c4b996e'
                   'SKIP')
sha256sums_aarch64=('ee0de361ef468ae5df2539b381413a8894cdecb08ea21f9cb740a8ab45cb4b78'
                    'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
