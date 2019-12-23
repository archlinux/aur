# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=w_scan2
pkgver=1.0.5
pkgrel=1
pkgdesc="w_scan fork (Small channel scan tool for vdr)"
url="https://github.com/stefantalpalaru/w_scan2"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'glibc')
#gcc-libs is somehow needed on arm architecture
source=("$pkgname-$pkgver.tar.gz::https://github.com/stefantalpalaru/w_scan2/archive/$pkgver.tar.gz")
sha256sums=('0492d6e03588f34c6eea84fb3a5a41409e427fb9f71c8ecbfd9cabe2ce2e3c93')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
