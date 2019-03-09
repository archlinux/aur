# Maintainer: archus <archus@archlinux.cba.pl>

pkgname=streamtuner2
pkgver=2.2.1
pkgrel=1
pkgdesc="An internet radio browser"
arch=('any')
url="http://sourceforge.net/projects/streamtuner2"
license=('custom')
depends=('python2' 'pygtk' 'python2-xdg' 'python2-pillow' 'python2-keybinder2' 'python2-lxml' 'python2-cssselect' 'python2-pyquery' 'python2-requests')
makedepends=('libarchive')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.rpm")
md5sums=('4b66fd3f73d3a8693b86249cd525edda')

package() {
  cd "${pkgdir}"
  bsdcpio -id -I "${srcdir}/${pkgname}-${pkgver}.rpm"
  # python2 fix
  sed -i 's:^#!.*/usr/bin/env.*python:#!/usr/bin/env python2:' "${pkgdir}/usr/bin/streamtuner2"
}
