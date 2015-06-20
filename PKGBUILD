pkgname=gpib-utils
pkgver=1.5
pkgrel=2
pkgdesc="GPIB instrument support utilities"
url="https://github.com/garlick/gpib-utils"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('linux-gpib')
source=("https://github.com/garlick/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha1sums=('677b6f74c541423a7bd9c8c5782a46786413fe1e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=${pkgdir}/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make install
  mv ${pkgdir}/usr/etc ${pkgdir}/etc

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
