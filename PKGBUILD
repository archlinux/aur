pkgname=ken
pkgver=1.1.1
pkgrel=1
pkgdesc="A sharp AUR/Pacman helper written in Go. Stable version."
arch=('x86_64' 'aarch64')
url="https://github.com/nespaset/ken"
license=('Apache')
depends=('pacman' 'git' 'binutils')
makedepends=('go')
provides=('kn' 'ken')
conflicts=('ken-git' 'ken-bin' 'sake-git' 'sk')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dc35f983cb746c7d9737ad5ecf9b1d2d3345c75197cf9530154ffd3e749602d2')

build() {
  cd "$pkgname-$pkgver"
  go build -o ken main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ken "$pkgdir/usr/bin/ken"
  ln -sf /usr/bin/ken "$pkgdir/usr/bin/kn"
}
