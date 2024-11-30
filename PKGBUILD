# Maintainer: VIVID <vivid@headrat.org>

pkgname=libg15
pkgver=1.3.1
pkgrel=2
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://github.com/vividnightmare/libg15"
license=('GPL')
depends=('libusb-compat')
conflicts=('libg15-git')
source=(https://github.com/vividnightmare/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('7a76b4fd9358d65f82009e9b448e158f6ca4424256ecf24608f1a47d87a500952283e7c2f7fc6940d4fa550f52c03ee7cdda146b28da4c85580bca43fbaadee2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  chmod +x configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
