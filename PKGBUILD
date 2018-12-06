# Maintainer: Ader <y1n0@pm.me>
pkgname=vlsmsolver
pkgver=1.2.1
pkgrel=1
pkgdesc="program that aims to help doing vlsm subnetting."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/khchanel/vlsmsolver"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/khchanel/vlsmsolver/archive/v${pkgver}.tar.gz")
sha1sums=("cae2f22cf5fccbbcf906b049b7bcbcd042837bcb")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make unix unix-gtk
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -Dm755 vlsmsolver vlsmsolver-gtk "$pkgdir/usr/bin"
}
