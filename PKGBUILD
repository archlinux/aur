# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-git
pkgver=r34.878d680
pkgrel=1
pkgdesc="Now Playing TUI written in Go"
arch=('x86_64')
url="https://github.com/justinmdickey/goplaying"
license=('MIT')
depends=('playerctl')
makedepends=('go' 'git')
provides=('goplaying')
conflicts=('goplaying')
source=("git+https://github.com/justinmdickey/goplaying.git")
md5sums=('SKIP')

pkgver() {
  cd goplaying
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd goplaying
  go build -v -o goplaying .
}

package() {
  cd goplaying
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
