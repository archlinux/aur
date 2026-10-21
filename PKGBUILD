# Maintainer: ftiasch <ftiasch0@gmail.com>
pkgname=backlog.md
pkgver=1.55.1
pkgrel=1
pkgdesc="Markdown-native Task Manager & Kanban visualizer for any Git repository"
arch=('x86_64')
url="https://github.com/MrLesk/Backlog.md"
license=('MIT')
depends=('glibc')
provides=('backlog')
conflicts=('backlog')

source=("$pkgname-$pkgver::https://github.com/MrLesk/Backlog.md/releases/download/v${pkgver}/backlog-bun-linux-x64")
sha256sums=('e100a5ee0030beccc4920ff182871e792c3455e3228a4077ef2471f52b981a89')

# Stripping breaks the embedded Bun application.
options=('!strip')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/backlog"
}
