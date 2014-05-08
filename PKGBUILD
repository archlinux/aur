# Maintainer: Steven Hiscocks <steven _at_ hiscocks _dot_ me _dot_ uk>

pkgname=xplanetfx
pkgver=2.5.23
pkgrel=1
pkgdesc="xplanet earth with realistic clouding and lightning effects as your wallpaper."
arch=('any')
url="http://mein-neues-blog.de/xplanetfx/"
license=('custom')
depends=('imagemagick' 'xplanet' 'perl-libwww' 'bc' 'pygtk')
optdepends=('perlmagick: cloud image verification'
            'libnotify: status messages'
            'acpi: check battery state before rendering')
options=()
install=
source=(http://repository.mein-neues-blog.de:9000/archive/xplanetfx-${pkgver}_all.tar.gz)
md5sums=('72877d93f10c5d752762a746b5aede68')

prepare() {
  cd ${srcdir}
  sed -i 's:#!/usr/bin/env python$:#!/usr/bin/env python2:' usr/share/xplanetFX/xplanetFX_{gtk,tray} usr/share/xplanetFX/stars/catalog.py
}

package() {
  cp -r ${srcdir}/usr ${pkgdir}
  install -Dm 644 ${srcdir}/usr/share/doc/xplanetFX/COPYING-F4A ${pkgdir}/usr/share/licenses/${pkgname}/COPYING-F2A
  install -Dm 644 ${srcdir}/usr/share/doc/xplanetFX/COPYING-WTFPL ${pkgdir}/usr/share/licenses/${pkgname}/COPYING-WTFPL
}

