# Maintainer: Jean-Luc Thumm <jeanlucthumm@gmail.com>
pkgname=reddit-systemd-scheduler
pkgver=1.0.1
pkgrel=1
pkgdesc="systemd service for scheduling posts to reddit"
url="https://github.com/jeanlucthumm/reddit-systemd-scheduler"
arch=("x86_64")
makedepends=("git" "python")
license=("GPL3")
source=("$pkgname-$pkgver::https://github.com/jeanlucthumm/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=("fd0b47afe6c29b95ea4b51410fd70c1b1dc396b316641a975b26ada852de14614a582ff472e73815cda7d72ee0002805d8333976a6184ef4ac5ec19c33814f7b")

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
