# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=gajim-plugin-otr
pkgver=1.7.7
pkgrel=4
pkgdesc="Off-The-Record Messaging Plugin for gajim."
arch=(any)
url="https://github.com/afflux/gotr"
license=('GPL')
depends=("gajim" "python2-potr")
provides=('gajim-plugin-otr')
conflicts=('gajim-plugin-otr-git')
source=("https://github.com/afflux/gotr/archive/v${pkgver}.tar.gz")

package() {
  cd $srcdir/gajim-otr-${pkgver}/src/
  sed -i "s#/usr/bin/env python#/usr/bin/env/python2#g" gotr/*
  install -d ${pkgdir}/usr/share/gajim/plugins/gotr
  install -Dm 644 gotr/* ${pkgdir}/usr/share/gajim/plugins/gotr/
}

sha512sums=('384070862f5407167de063158b74f6edd26ef4b17241d5ac522a809a049365187240d142332b525d440931b71271503ce02a6ec7013337abddb7534622d44b54')

# vim:set ts=2 sw=2 et:

