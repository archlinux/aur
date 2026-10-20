# Maintainer: ftiasch <ftiasch0@gmail.com>
pkgname=backlog.md
pkgver=1.55.0
pkgrel=1
pkgdesc="Markdown-native Task Manager & Kanban visualizer for any Git repository"
arch=('x86_64')
url="https://github.com/MrLesk/Backlog.md"
license=('MIT')
depends=('glibc')
provides=('backlog')
conflicts=('backlog')

source=("$pkgname-$pkgver::https://github.com/MrLesk/Backlog.md/releases/download/v${pkgver}/backlog-bun-linux-x64")
sha256sums=('d845a698c7c4d92b30d9e3a0cef2bb61a5821993b470c9e59a1491f02e27459e')

# Stripping breaks the embedded Bun application.
options=('!strip')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/backlog"
}
