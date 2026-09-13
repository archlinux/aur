# Maintainer: ftiasch <ftiasch0@gmail.com>
pkgname=backlog.md
pkgver=1.52.0
pkgrel=1
pkgdesc="Markdown-native Task Manager & Kanban visualizer for any Git repository"
arch=('x86_64')
url="https://github.com/MrLesk/Backlog.md"
license=('MIT')
depends=('glibc')
provides=('backlog')
conflicts=('backlog')

source=("$pkgname-$pkgver::https://github.com/MrLesk/Backlog.md/releases/download/v${pkgver}/backlog-bun-linux-x64-baseline")
sha256sums=('d06c7d1a04bbdb5f0d252264a9ca57d3e1c8873955de661f09ee49e4c19064fc')

# Stripping breaks the embedded Bun application.
options=('!strip')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/backlog"
}
