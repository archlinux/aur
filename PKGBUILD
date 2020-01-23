# Maintainer: soredake <fdsfgs@krutt.org>
pkgname=roberta
pkgver=0.1.0
pkgrel=1
pkgdesc='Steam Play compatibility tool to run adventure games using native Linux ScummVM'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
depends=('python' 'scummvm' 'inotify-tools')
makedepends=('git')
optdepends=( 'steam: The Steam client' )
source=("git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
