# Maintainer: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=0.2.1
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
provides=('flameshot')
source=("https://github.com/lupoDharkael/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('376cb8f4ecc548f0514d7b01e8584bffa53a40c09d7052f430b5442173ee4189')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/flameshot" "${pkgdir}/usr/bin/flameshot"
}
