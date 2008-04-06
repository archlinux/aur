# $Id: PKGBUILD,v 1.5 2008/02/02 18:17:03 damir Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.4.8
pkgrel=1
pkgdesc="CMake is a cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('gcc-libs>=4.0.3' 'glibc' 'ncurses')
source=("http://www.cmake.org/files/v2.4/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./bootstrap --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -Dm644 $startdir/src/$pkgname-$pkgver/Copyright.txt $startdir/pkg/usr/share/licenses/$pkgname/Copyright.txt

  # Correct permissions
  #find $startdir/pkg/usr/share/CMake/Modules -type f -exec chmod 644 "{}" ";"
}
md5sums=('f5dd061c31765a49dc17ae8bdc986779')
