# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=keypress
pkgver=0.3.6
pkgrel=1
pkgdesc="A raw keyboard input reader"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${pkgname}"
license=(MIT)
provides=('keypress')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c600d425f853efc889be73b31bbaa6a21f0c03e4e17505d6ed669e56fe339685')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
