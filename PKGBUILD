# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=keypress
pkgver=0.3.5
pkgrel=1
pkgdesc="A raw keyboard input reader"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${pkgname}"
license=(MIT)
provides=('keypress')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('555d45cfbf55d795844e2324b3b1eb7b4cd2c8208305e15e062236a5f377e6d4')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
