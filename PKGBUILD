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
source=("https://github.com/dreamer/roberta/archive/v$pkgver.tar.gz")
sha512sums=('f28d98e814fe6feb29184fc46336e9dcd7d63ab507d7999087f5301e427a2544680a486c1b4d83a0c76acd6d9cb98cab55c8fa18b0d17f5c851308ca8e1fdbcf')

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
}
