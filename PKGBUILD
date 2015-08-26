# Maintainer: SanskritFritz (gmail)
# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
pkgver=2.7.1
_build=r1924
pkgrel=1
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="http://ganttproject.sourceforge.net/"
license="GPL"
depends=('java-runtime')
makedepends=('unzip')
source=("http://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver-$_build.zip"
	"ganttproject.desktop")

package() {
  mkdir -p "$pkgdir/opt/"
  cp --recursive "$srcdir/ganttproject-$pkgver-$_build" "$pkgdir/opt/$pkgname"

  chmod 755 "$pkgdir/opt/$pkgname/ganttproject"
  install -D -m0644 "$srcdir/ganttproject.desktop" "$pkgdir/usr/share/applications/ganttproject.desktop"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/ganttproject" "$pkgdir/usr/bin/ganttproject"
}

md5sums=('978013d4a275f0e5948eee21d1771060'
         '4851e795b2fd99ac416ff65d2c73ca75')
