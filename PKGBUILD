# Maintainer: Navaz Alani <navaz-alani ON gitlab AND github>
pkgname=archer-dwmstat-git
pkgver=0.7.r1dbb6e2.5
pkgrel=1
pkgdesc="Event driven modular status-bar for dwm; written in Go & using Unix sockets for more advanced signaling."
arch=(x86_64)
url="https://gitlab.com/navaz-alani/archer-dwmstat.git"
license=('MIT')
groups=('archer')
makedepends=(go)
provides=(dwmstat)
source=("git+$url")
sha256sums=('SKIP')
validpgpkeys=(
  '47397ED487ECE052386AD5A58239A2928E9B8850' # Navaz Alani
)

pkgver() {
  printf "0.7.r%s.%s" `git rev-parse --short  HEAD` `git rev-list --count HEAD`
}

package() {
	cd archer-dwmstat
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
