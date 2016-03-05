# Maintainer: SanskritFritz (gmail)
# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
pkgver=2.7.2
_build=r1954
pkgrel=2
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="http://ganttproject.sourceforge.net/"
license=("GPL")
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

md5sums=('9ef9c32b82ee3723cf5872bc4d33df97'
         '4851e795b2fd99ac416ff65d2c73ca75')
