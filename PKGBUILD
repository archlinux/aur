#!/bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=mangatux-git
pkgver=0.9.1.r0.ga9b311f
pkgrel=1
pkgdesc="The new and refreshed manga downloader based on LMD. Git version"
arch=('any')
url="https://github.com/jorge-barroso/${pkgname}/tree/master"
license=('GPL3')
depends=('libnotify' 'gtkdialog' 'wget' 'lynx' 'zenity')
optdepends=('imagemagick: PDF manga download support (only Submanga yet)')
provides=(mangatux)
conflicts=(mangatux)
install=mtx.install
source=(git+https://github.com/jorge-barroso/mangatux.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/mangatux"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {

#Creating Directories

install -m755 -d ${pkgdir}/usr/bin/
install -m755 -d ${pkgdir}/usr/share/{applications,icons,mangatux/langs,doc/mangatux}

#Installing
    
install -m755 ${srcdir}/mangatux/src/usr/bin/*					${pkgdir}/usr/bin/
install -m755 ${srcdir}/mangatux/src/usr/share/applications/mangatux.desktop	${pkgdir}/usr/share/applications/mangatux.desktop
install -m755 ${srcdir}/mangatux/src/usr/share/icons/pen.png 			${pkgdir}/usr/share/icons/pen.png
install -m755 ${srcdir}/mangatux/src/usr/share/mangatux/langs/ca_CA 		${pkgdir}/usr/share/mangatux/langs/ca_CA
install -m755 ${srcdir}/mangatux/src/usr/share/mangatux/langs/es_ES	 	${pkgdir}/usr/share/mangatux/langs/es_ES
install -m755 ${srcdir}/mangatux/src/usr/share/mangatux/langs/en_EN 		${pkgdir}/usr/share/mangatux/langs/en_EN
install -m755 ${srcdir}/mangatux/src/usr/share/doc/mangatux/*     ${pkgdir}//usr/share/doc/mangatux/

}

# vim:set ts=2 sw=2 et:
