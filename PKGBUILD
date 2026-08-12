# Maintainer: marco-l
pkgname=paclog-tui
pkgver=0.1.4
pkgrel=1
pkgdesc="A Textual TUI for browsing pacman's history log"
arch=('any')
url="https://codeberg.org/marco-l/paclog-tui"
license=('MIT')
depends=('python' 'python-textual' 'python-rich')
optdepends=('python-pytest: for unit testing'
            'python-pytest-asyncio: for unit testing')

source=("paclog-tui-0.1.4.tar.gz::https://codeberg.org/marco-l/paclog-tui/releases/download/v0.1.4/paclog-tui-0.1.4.tar.gz")
sha256sums=('cfee707bbb2ac673ab44e586e3241d3332fe1a525a8333412f6251cc95cb20ee')

package() {
  cd "$pkgname"

  install -Dm755 src/paclog-tui "$pkgdir/usr/bin/paclog-tui"

  install -Dm644 src/lib/filters.py src/lib/pacman_log.py src/lib/render.py \
    src/lib/state.py src/lib/transactions.py src/lib/watch.py \
    -t "$pkgdir/usr/share/paclog/lib/"

  install -Dm644 src/man/paclog-tui.1 -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
