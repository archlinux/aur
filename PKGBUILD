# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
pkgname='epad'
pkgver='0.9.4'
pkgrel=1
pkgdesc='Simple text editor using Python and EFL'
arch=('any')
url='http://jeffhoogland.github.io/ePad/'
license=('GPL3')
depends=('python-efl' 'python-elmextensions')
source=('https://github.com/JeffHoogland/ePad/archive/0.9.4.tar.gz')
sha256sums=('203bbfe8486a525845caacf81d26061399e308366592f416d7479f226ba60cc0')

prepare() {
  cd "${srcdir}/ePad-${pkgver}"
  sed -i '1c\#!/usr/bin/env python3' epad  
}
package() {
  cd "${srcdir}/ePad-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  cp epad "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/man/man1/"
  cp epad.1 "${pkgdir}/usr/share/man/man1/"
  install -dm755 "${pkgdir}/usr/share/applications/"
  cp ePad.desktop "${pkgdir}/usr/share/applications/"
}
