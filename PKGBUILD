# Maintainer: Facundo Tuesca <facutuesca AT gmail DOT com>

pkgname=streamtuner2
pkgver=2.2.0
pkgrel=1
pkgdesc="An internet radio browser"
arch=('any')
url="http://sourceforge.net/projects/streamtuner2"
license=('custom')
depends=('python2' 'pygtk' 'python2-xdg' 'python2-pillow' 'python2-keybinder2' 'python2-lxml' 'python2-cssselect' 'python2-pyquery' 'python2-requests')
makedepends=('libarchive')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.rpm")
md5sums=('11e4c5a481ec5ad7ee5f9c213077bea1')

package() {
  cd "${pkgdir}"
  bsdcpio -id -I "${srcdir}/${pkgname}-${pkgver}.rpm"
  # python2 fix
  sed -i 's:^#!.*/usr/bin/env.*python:#!/usr/bin/env python2:' "${pkgdir}/usr/bin/streamtuner2"
}
