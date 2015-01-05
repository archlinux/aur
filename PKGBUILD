# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=0.2.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('891030c60bcaa0fea36f51753a8b719276ce17dd855f7f851d8c4e4f2c66fdda')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make install
}
