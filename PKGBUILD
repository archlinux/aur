# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search-bin
_pkgname=claude-conversation-search
pkgver=1.5.0
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
sha256sums=('c1deae87afd920648b56c63bd83be21dce771988962b1cab062ed497e4bf31e6'
            'SKIP')
sha256sums_x86_64=('7b500abe6987afc813ecf98c9cdfe48b3a89417a32e17d2aff232e71fc4873b1'
                   'SKIP')
sha256sums_aarch64=('77ecabc24722c233c8fb53b1e4e4ef8077cbb9557d2fb35eb1bde98b63d447a1'
                    'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
