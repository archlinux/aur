# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=keypress
pkgver=0.3.4
pkgrel=1
pkgdesc="A raw keyboard input reader"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/${pkgname}"
license=(MIT)
provides=('keypress')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e3bbeb6530b6101776084f7fdc7db825360d33bedca64601116d10cea5f00113')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man PREFIX=/usr install
}
