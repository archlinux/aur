#!/bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=mangatux
pkgver=0.9.1
pkgrel=1
pkgdesc="The new and refreshed manga downloader based on LMD"
arch=('any')
url="https://github.com/jorge-barroso/${pkgname}/tree/master"
license=('GPL3')
depends=('libnotify' 'gtkdialog' 'wget' 'lynx' 'zenity')
optdepends=('imagemagick: PDF manga download support (only Submanga yet)')
provides=(mangatux)
conflicts=(mangatux-git)
install=mtx.install
source=(https://github.com/jorge-barroso/$pkgname/archive/$pkgver.zip)
sha512sums=('5f01a189d3dce0bcbce2185142bee33e8c5e4a16db27d0ee52bc14b26eb9d261159b2cb3152605fe24d3edd499e593a9e436716b53c19e8c3dec622c05e13a78')

package() {

#Creating Directories

install -m755 -d ${pkgdir}/usr/bin/
install -m755 -d ${pkgdir}/usr/share/{applications,icons,mangatux/langs,doc/mangatux}

#Installing
    
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/bin/*					${pkgdir}/usr/bin/
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/applications/mangatux.desktop	${pkgdir}/usr/share/applications/mangatux.desktop
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/icons/pen.png 			${pkgdir}/usr/share/icons/pen.png
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/mangatux/langs/ca_CA 		${pkgdir}/usr/share/mangatux/langs/ca_CA
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/mangatux/langs/es_ES	 	${pkgdir}/usr/share/mangatux/langs/es_ES
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/mangatux/langs/en_EN 		${pkgdir}/usr/share/mangatux/langs/en_EN
install -m755 ${srcdir}/mangatux-$pkgver/src/usr/share/doc/mangatux/*			${pkgdir}/usr/share/doc/mangatux/
}

# vim:set ts=2 sw=2 et:
