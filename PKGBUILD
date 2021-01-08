# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Philippe Cherel <philippe dot cherel at mayenne dot org>
# Contributor: fabioticconi <fabio dot ticconi at gmail dot com>

pkgname=weidu-bin
pkgver=247
pkgrel=1
pkgdesc="A dialogue compiler for Infinity Engine games (precompiled binary)"
arch=('x86_64')
url="http://weidu.org"
license=('GPL2')
source=(https://github.com/WeiDUorg/weidu/releases/download/v$pkgver.00/WeiDU-Linux-$pkgver-amd64.zip)
md5sums=('3b2abb25f34e728960a454e05c654e5c')
options=('!strip')

package() {
  
  cd "$srcdir/WeiDU-Linux"
  
  install -D -m755 ./mosunpack "${pkgdir}/usr/bin/mosunpack"
  install -D -m755 ./mospack "${pkgdir}/usr/bin/mospack"
  install -D -m755 ./tisunpack "${pkgdir}/usr/bin/tisunpack"
  install -D -m755 ./tispack "${pkgdir}/usr/bin/tispack"
  install -D -m755 ./tolower "${pkgdir}/usr/bin/tolower"
  install -D -m755 ./weidu "${pkgdir}/usr/bin/weidu"
  install -D -m755 ./weinstall "${pkgdir}/usr/bin/weinstall"
  
  # copy the examples & lib directories
  install -m755 -d "${pkgdir}/usr/share/${pkgname}/lib" "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cp -r ./lib "${pkgdir}/usr/share/${pkgname}/lib"  
  cp -r ./examples "${pkgdir}/usr/share/doc/${pkgname}/examples"

  # copy the readmes
  install -D -m644 ./readme-mosunpack.txt "${pkgdir}/usr/share/doc/${pkgname}/readme-mosunpack.txt"
  install -D -m644 ./readme-tisunpack.txt "${pkgdir}/usr/share/doc/${pkgname}/readme-tisunpack.txt"
  install -D -m644 ./README-WeiDU-Changes.txt "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU-Changes.txt"
  install -D -m644 ./README-WeiDU.html "${pkgdir}/usr/share/doc/${pkgname}/README-WeiDU.html"
}
