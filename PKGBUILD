# Maintainer: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=0.2.0
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
provides=('flameshot')
source=("https://github.com/lupoDharkael/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('5c79f4374661b6f4f82ad1a94b0b725337563e233f0e49a29eda6ce54bee5ec6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/flameshot "${pkgdir}/usr/bin/flameshot"
}
