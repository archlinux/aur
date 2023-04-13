# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=havoc
pkgver=0.5.0
pkgrel=1
pkgdesc='minimal terminal emulator for Wayland on Linux'
arch=(x86_64)
url='https://github.com/ii8/havoc'
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ii8/havoc/archive/${pkgver}.tar.gz)
b2sums=('ab2193e27456dfe2146cc291daf5ad9750a7c76df516003dab1ba1696281eaefe397b77568f6ff25123dc3baf95e5fdc544add1302c386c74489560e7dbd7961')


build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
