# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Nassim Kacha <nassim.kacha@gmail.com>

pkgname=innotop
pkgver=1.16.0
pkgrel=1
pkgdesc="A powerful "top" clone for MySQL (MariaDB)"
arch=(any)
url="https://github.com/innotop/innotop"
license=(GPL-2.0-or-later)
depends=(perl-dbd-mysql perl-term-readkey)
options=('!emptydirs')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('45645f20e70d54adc5208b5098beb378f5f29fc5e0447237351311418cc9933b')

build() {
  cd ${pkgname}-${pkgver}
  perl Makefile.PL
}

package() {
  cd ${pkgname}-${pkgver}
  make INSTALLSITESCRIPT=/usr/bin DESTDIR="${pkgdir}"/ install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
