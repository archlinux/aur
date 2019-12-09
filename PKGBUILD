# Maintainer: Amos Bird <amosbird at gmail dot com>

pkgname=caps-indicator
pkgver=1.0.r2.g0ad7ce8
pkgrel=1
pkgdesc="A simple X11 CapsLock indicator"
arch=('i686' 'x86_64')
url="https://github.com/amosbird/caps-indicator"
license=('MIT')
depends=('libxcb')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd caps-indicator
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd caps-indicator
  make
}

package() {
  cd caps-indicator
  make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
