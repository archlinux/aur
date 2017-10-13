# Maintainer: ZaZam <zazaamm ät gmail döt com>

pkgname=libdvd-audio
pkgver=1.0.0
pkgrel=1
pkgdesc="A C library for extracting audio from DVD-Audio discs."
arch=('i686' 'x86_64')
url='http://libdvd-audio.sourceforge.net'
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=(b0a19670b07d9bbc3622ecd0d50b2ead56f1d7b2c9c3082a02f7cee75532fd333e1ebd5fafeeb431d2427c2dfcebdb9ffb03fb3b6b4d6ce6f307e0333e5beb64)

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d ${pkgdir}/usr/{include,bin,lib{,/pkgconfig}}
  make BIN_DIR=${pkgdir}/usr/bin LIB_DIR=${pkgdir}/usr/lib INCLUDE_DIR=${pkgdir}/usr/include LIB_DIR=${pkgdir}/usr/lib PKG_CONFIG_DIR=${pkgdir}/usr/lib/pkgconfig install
}
