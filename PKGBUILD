# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=i2util
pkgver=4.2.1
pkgrel=1
pkgdesc="Internet2 utility tools"
arch=("x86_64")
url="https://software.internet2.edu/"
license=('Apache')
depends=("glibc")
source=("https://github.com/perfsonar/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eb72b50fad16c40f61515ecee8ede2ecc85be3e1d92aa0650dc8be20c8f03f7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
