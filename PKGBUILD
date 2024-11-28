# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Nassim Kacha <nassim.kacha@gmail.com>

pkgname=innotop
pkgver=1.15.2
pkgrel=1
pkgdesc="A powerful "top" clone for MySQL (MariaDB)"
arch=(any)
url="https://github.com/innotop/innotop"
license=(GPL-2.0-or-later)
depends=(perl-dbd-mysql perl-term-readkey)
options=('!emptydirs')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cfedf31ba5617a5d53ff0fedc86a8578f805093705a5e96a5571d86f2d8457c0')

build() {
  cd ${pkgname}-${pkgver}
  perl Makefile.PL
}

package() {
  cd ${pkgname}-${pkgver}
  make INSTALLSITESCRIPT=/usr/bin DESTDIR="${pkgdir}"/ install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
