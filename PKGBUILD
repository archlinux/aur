# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=libext2fs-wii
pkgver=1.0.5
pkgrel=1
pkgdesc='Ext2/3/4 filesystem access library (for Nintendo Gamecube/Wii homebrew development)'
arch=('any')
url='http://code.google.com/p/libext2fs-wii/'
license=('GPL')
options=(!strip staticlibs)
depends=('devkitppc')
makedepends=('svn')
source=($pkgname-$pkgver::"svn+http://libext2fs-wii.googlecode.com/svn/tags/v$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver

  source /etc/profile.d/devkitppc.sh
  make
}

package() {
  cd $pkgname-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  install -d "$DEVKITPRO"/libogc/{include,lib/{cube,wii}}
  make install
}
