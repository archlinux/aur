# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>
pkgname=herbe
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="Daemon-less notifications without D-Bus. Minimal and lightweight."
arch=('i686' 'x86_64')
url="https://github.com/trizen/${pkgname}"
license=('MIT')
depends=(libx11)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dudik/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('78e454159050c86e030fb5a6cf997ac914345210cdf5a4ca4d7600c5296b7f76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
