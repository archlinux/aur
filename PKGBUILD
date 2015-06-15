# Maintainer: Sándor Nagy <sanya868 at gmail dot com>
# Contributor: Jeramy Harrison <dbralir@gmail.com>
# Contributor: Onni R. <onnir at iki dot fi>
pkgname=png++
pkgver=0.2.7
pkgrel=1
license=('custom')
pkgdesc='A C++ wrapper for libpng.'
arch=('i686' 'x86_64')
url='http://savannah.nongnu.org/projects/pngpp/'
depends=('libpng')
makedepends=('doxygen')
source=("http://download.savannah.gnu.org/releases/pngpp/$pkgname-$pkgver.tar.gz")
md5sums=('99a74f9d02975ce9c893725476b47d95')

build() {
  cd $srcdir/$pkgname-$pkgver
  make docs || return 1
}

package() {
  mkdir -p "${pkgdir}/usr/include" || return 1
  mkdir -p "${pkgdir}/usr/share/doc" || return 1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
  cd $srcdir/$pkgname-$pkgver
  make install PREFIX="${pkgdir}/usr" || return 1
  cp -f COPYING ${pkgdir}/usr/share/licenses/$pkgname
}
