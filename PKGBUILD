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
source=("https://github.com/dreamer/roberta/releases/download/v$pkgver/roberta.tar.xz")
sha512sums=('bf71671bc5ef109ee3bc146d203d96d4957cd9ccd48a50a156e6c5a95902795662f589dc79ec882cae30f2c03a48e473e90fbc927842300718ba82bcf318dbf2')

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
