# Maintainer: ftiasch <ftiasch0@gmail.com>
pkgname=backlog.md
pkgver=1.55.3
pkgrel=1
pkgdesc="Markdown-native Task Manager & Kanban visualizer for any Git repository"
arch=('x86_64')
url="https://github.com/MrLesk/Backlog.md"
license=('MIT')
depends=('glibc')
provides=('backlog')
conflicts=('backlog')

source=("$pkgname-$pkgver::https://github.com/MrLesk/Backlog.md/releases/download/v${pkgver}/backlog-bun-linux-x64")
sha256sums=('c20d5c51aa95b66d5c89428927bb0a16dc7beb9110683d66387e0514925f274a')

# Stripping breaks the embedded Bun application.
options=('!strip')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/backlog"
}
