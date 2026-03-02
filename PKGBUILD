# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Philippe Cherel <philippe dot cherel at mayenne dot org>
# Contributor: fabioticconi <fabio dot ticconi at gmail dot com>

pkgname=weidu-bin
pkgver=251
_pkgver=251.00
pkgrel=1
pkgdesc="A dialogue compiler for Infinity Engine games (precompiled binary)"
arch=('x86_64')
url="http://weidu.org"
license=('GPL-2.0-or-later')
source=(https://github.com/WeiDUorg/weidu/releases/download/v$_pkgver/WeiDU-Linux-$pkgver.zip)
sha256sums=('3e1a34ec5d6e934b1d4a34541a1312d0170b120c6efe903a732415acde3bd3c0')
options=('!strip')

package() {
  
  cd "$srcdir/WeiDU-Linux"
  
  install -D -m755 ./tolower "${pkgdir}/usr/bin/tolower"
  install -D -m755 ./weidu "${pkgdir}/usr/bin/weidu"
  install -D -m755 ./weinstall "${pkgdir}/usr/bin/weinstall"
  
  # copy the examples & lib directories
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples" #"${pkgdir}/usr/share/${pkgname}/lib"
#  cp -r ./lib "${pkgdir}/usr/share/${pkgname}/lib"  
  cp -r ./examples "${pkgdir}/usr/share/doc/${pkgname}/examples"

  # copy the readmes
  install -D -m644 ./README-WeiDU-Changes.txt "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU-Changes.txt"
  install -D -m644 ./README-WeiDU.html "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU.html"
}
