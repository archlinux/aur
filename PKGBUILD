pkgname=ken
pkgver=1.0.1
pkgrel=1
pkgdesc="A sharp AUR/Pacman helper written in Go. Stable version."
arch=('x86_64' 'aarch64')
url="https://github.com/nespaset/ken"
license=('Apache')
depends=('pacman' 'git' 'binutils')
makedepends=('go')
provides=('kn' 'sk')
conflicts=('ken-git' 'ken-bin' 'sake-git' 'sk')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  go build -o ken main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ken "$pkgdir/usr/bin/ken"
  ln -sf /usr/bin/ken "$pkgdir/usr/bin/kn"
}
