# Maintainer: lynix <lynix47@gmail.com>

pkgname=aerotools-git
pkgver=r77.7109ba7
pkgrel=1
pkgdesc="CLI and hddtemp proxy for querying aquaero(R) 4.0 USB devices"
arch=('i686' 'x86_64')
url="https://github.com/lynix/aerotools"
license=('GPL3')
depends=('libusb>=1.0.8')
makedepends=('git' 'pkgconfig')
provides=('aerotools')
conflicts=('aerotools')
source=('git+https://github.com/lynix/aerotools.git')
md5sums=('SKIP')

pkgver() {
  cd aerotools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd aerotools
	make
}

package() {
  cd aerotools
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
