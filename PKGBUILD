# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="lib32-libart_lgpl-bin"
pkgver=2.3.21_36_43
_pkgver=( ${pkgver//_/ } )
_upver="${_pkgver[0]}"
_buildver="${_pkgver[1]}"
_fcver="${_pkgver[2]}"
pkgrel=1
pkgdesc='A library for high-performance 2D graphics (32-bit)'
arch=('x86_64')
url='https://levien.com/libart/'
license=('LGPL-2.0-or-later')
depends=('lib32-glibc')
provides=(
  'lib32-libart'
  'lib32-libart2'
  'lib32-libart_2'
  'lib32-libart-2'
  'lib32-libart_lgpl'
  'lib32-libart_lgpl2'
  'lib32-libart_lgpl_2'
  'lib32-libart_lgpl-2'
  'lib32-libart-lgpl'
  'lib32-libart-lgpl2'
  'lib32-libart-lgpl-2'
  'libart_lgpl.so=2'
)
conflicts=(
  'lib32-libart'
  'lib32-libart2'
  'lib32-libart_2'
  'lib32-libart-2'
  'lib32-libart_lgpl'
  'lib32-libart_lgpl2'
  'lib32-libart_lgpl_2'
  'lib32-libart_lgpl-2'
  'lib32-libart-lgpl'
  'lib32-libart-lgpl2'
  'lib32-libart-lgpl-2'
)
options=(staticlibs !buildflags !makeflags !strip !debug)
source=("https://kojipkgs.fedoraproject.org/packages/libart_lgpl/$_upver/$_buildver.fc$_fcver/i686/libart_lgpl-$_upver-$_buildver.fc$_fcver.i686.rpm")
sha256sums=('cc0ed44c1255b50881f65a522e83d43cc832b587ac217c7565ec26c9f46d9afc')

package() {
  mv "$srcdir/usr" "$pkgdir"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/share/doc/libart_lgpl" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/share/licenses/libart_lgpl" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib32/.build-id"
}
