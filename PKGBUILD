# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=0.1.0
pkgrel=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('9306cb9ac0b9d070511e0bb4a82c5050770f67b288513ba8b449dc596a0e08f7')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make install
}
