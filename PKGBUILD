# Maintainer: luelistan <archlinux-aur-git@max-weller.de>

pkgname=dhtest
pkgver=2c6a9c3ef96e570b213fb9592bed1aae28c9d7cd
pkgrel=1
pkgdesc="A DHCP client simulation on linux"
arch=("x86_64")
depends=("glibc")
url="https://github.com/saravana815/dhtest"
license=('GPL2')

source=("https://github.com/saravana815/dhtest/archive/${pkgver}.tar.gz")
sha256sums=("39d30b14333cb8bb7b5b74eafaef6dab5c56cf69bddb81c76be3f69f50ca4a8b")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install dhtest $pkgdir/usr/bin/dhtest
}

