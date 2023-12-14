# Maintainer: dorkster
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=gcw0-toolchain
pkgver=2021.10.22
pkgrel=2
pkgdesc="Build environment for the Open Source handheld console GCW Zero"
arch=('i686' 'x86_64')
url="https://opendingux.net/"
license=('GPL2')
options=(!strip libtool staticlibs)
depends=('gmp')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-gmp')
fi
install=$pkgname.install
source=("https://od.abstraction.se/opendingux/toolchain/opendingux-$pkgname.${pkgver//./-}.tar.xz")
sha256sums=('359fbcbf884649be54799a390aabd031a3fee675fd8098613c9dca1bd96a21b6')
noextract=("opendingux-$pkgname.${pkgver//./-}.tar.xz")

package() {
  msg2 "extracting files..."
  install -d "$pkgdir"/opt
  bsdtar xf opendingux-$pkgname.${pkgver//./-}.tar.xz -C "$pkgdir"/opt
}
