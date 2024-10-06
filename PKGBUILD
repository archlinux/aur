# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Nassim Kacha <nassim.kacha@gmail.com>

pkgname=innotop
pkgver=1.15.1
pkgrel=1
pkgdesc="A powerful "top" clone for MySQL (MariaDB)"
arch=(any)
url="https://github.com/innotop/innotop"
license=(GPL-2.0-or-later)
depends=(perl-dbd-mysql perl-term-readkey)
options=('!emptydirs')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8aa53aa54d2a81ff1c62a2fe1095d373778f7a755e150f8196f9702775b3f407')

build() {
  cd ${pkgname}-${pkgver}
  perl Makefile.PL
}

package() {
  cd ${pkgname}-${pkgver}
  make INSTALLSITESCRIPT=/usr/bin DESTDIR="${pkgdir}"/ install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
