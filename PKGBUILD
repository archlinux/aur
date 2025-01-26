# Contributor: LaserEyess lasereyess@lasereyess.net

pkgname=tarpyt
_pkgname=TarPyt
pkgver=25.01
pkgrel=1
pkgdesc='A Python ssh/http/smtp/etc. tarpit'
arch=('any')
url='https://github.com/LaserEyess/TarPyt'
license=('GPL-3.0-or-later')
depends=('libsystemd' 'python')
makedepends=('git' 'meson')
provides=('tarpyt')
conflicts=('tarpyt')
source=("tarpyt-${pkgver}.tar.gz::https://github.com/LaserEyess/TarPyt/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4f7a13880538c1a6b405845c9c6a8559234c7bd2ece674722e718f34cb197ca2f05c822436f16d7db771a994bd7f82944775489d3c2bae4b783738b4cb2f5f22')

prepare() {
  meson setup build "${_pkgname}-${pkgver}" --prefix=/usr
}

package() {
  meson install -C build --destdir="$pkgdir"
}
