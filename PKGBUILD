# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=srm
pkgver=1.2.15
pkgrel=1
pkgdesc="A secure replacement for rm(1) that overwrites data before unlinking"
arch=('x86_64')
url="http://srm.sourceforge.net/"
license=('custom')
depends=('glibc')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('681cbb0950b25e300a3f6d680f57f56c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/srm/LICENSE"
}
