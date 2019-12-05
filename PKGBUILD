# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=mescc-tools
pkgver=0.6.1
pkgrel=1
pkgdesc="tools for binary bootstrapping"
arch=(x86_64)
license=('GPL')
url="https://github.com/oriansj/mescc-tools"
depends=(glibc)
source=("https://github.com/oriansj/mescc-tools/archive/Release_0.6.1.tar.gz")
sha256sums=('56f02bb9c92c6569197ec91246e366048efd47e32d9365a812f64bd70dde571a')

build() {
  cd mescc-tools-Release_$pkgver
  make
}

check() {
  cd mescc-tools-Release_$pkgver
  make test
}

package() {
  cd mescc-tools-Release_$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}
