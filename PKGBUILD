# Maintainer: Gustavo Heinz <gustavo@gsthnz.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: ny-a <nyaarch64 at gmail dot com>

pkgname=rem
pkgver=2.0.1
pkgrel=1
pkgdesc="portable library for real-time audio and video processing"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/rem"
license=('BSD')
depends=('re')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6fda6f29999143ae2198044d9c08a0dca9c8af979413b31e010f4eed3404f72b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
