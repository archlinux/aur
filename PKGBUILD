# Maintainer: Kaarel <github.com/kaareloun>
# Installs the prebuilt binary from the GitHub release. Updated by .github/workflows/release.yml.
pkgname=kanbanana-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Kanban board for your Linear issues, with Claude Code built in (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kaareloun/kanbanana"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('xdg-desktop-portal: file picker for attaching images'
            'claude-code: Claude Code integration over MCP')
provides=('kanbanana')
conflicts=('kanbanana')
options=('!debug')
source_x86_64=("kanbanana-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/kanbanana-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b36570d54dd313ab6882412609b893574c4b902f8fe47dbd53af30c94aae4800')

package() {
  cd "kanbanana-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 kanbanana "$pkgdir/usr/bin/kanbanana"
  install -Dm644 kanbanana.desktop "$pkgdir/usr/share/applications/kanbanana.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/kanbanana.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
