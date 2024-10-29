# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-git
pkgver=r21.7c37bd9
pkgrel=1
pkgdesc="A basic Now Playing TUI written in Go"
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

install_license() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package() {
  cd goplaying
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install_license
}
