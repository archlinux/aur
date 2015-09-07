# Maintainer: dorkster
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=gcw0-toolchain
pkgver=2014.08.20
pkgrel=1
pkgdesc="Build environment for the Open Source handheld console GCW Zero"
arch=('i686' 'x86_64')
url="http://www.gcw-zero.com/develop"
license=('GPL2')
options=(!strip libtool staticlibs)
depends=('gmp')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-gmp')
fi
install=$pkgname.install
source=("http://www.gcw-zero.com/files/opendingux-$pkgname.${pkgver//./-}.tar.bz2")
sha256sums=('3632c85f48879108d4349570ded60d87d7a324850b81d683d031e4ee112baaa0')
noextract=("opendingux-$pkgname.${pkgver//./-}.tar.bz2")

package() {
  msg2 "extracting files..."
  install -d "$pkgdir"/opt
  bsdtar xf opendingux-$pkgname.${pkgver//./-}.tar.bz2 -C "$pkgdir"/opt
}
