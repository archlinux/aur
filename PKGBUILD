# Maintainer: Facundo Tuesca <facutuesca AT gmail DOT com>

pkgname=streamtuner2
pkgver=2.1.9
pkgrel=3
pkgdesc="An internet radio browser"
arch=('any')
url="http://sourceforge.net/projects/streamtuner2"
license=('custom')
depends=('python2' 'pygtk' 'python2-xdg' 'python2-pillow' 'python2-keybinder2' 'python2-lxml' 'python2-cssselect' 'python2-pyquery' 'python2-requests')
makedepends=('libarchive')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.rpm")
md5sums=('c2fe91f38cbdadf7052f731fd0fa8789')

package() {
  cd "${pkgdir}"
  bsdcpio -id -I "${srcdir}/${pkgname}-${pkgver}.rpm"
  # python2 fix
  sed -i 's:^#!.*/usr/bin/env.*python:#!/usr/bin/env python2:' "${pkgdir}/usr/bin/streamtuner2"
}
