# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=zotero-db-cli
_pkgname=zotero-cli
_commit=f29df2dc52a06f07e3a8da4c6f3c47da1e138d46
pkgver=0.0.0.r4.gf29df2d
pkgrel=1
pkgdesc="Read-only CLI for querying Zotero client SQLite metadata and PDF annotation positions"
arch=('any')
url="https://github.com/decent-tools-for-thought/zotero-cli"
license=('custom:unknown')
depends=('python' 'sqlite')
makedepends=('git')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 zotero-client-sqlite/scripts/zotero_sqlite_tool.py \
    "$pkgdir/usr/bin/zotero-sqlite-tool"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
