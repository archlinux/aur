# Maintainer: SanskritFritz (gmail)
# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
pkgver=2.8.3
_build=r2088
pkgrel=1
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

md5sums=('a4d08e130b2c1f6a03fbe912900ea133'
         '8fdea541135fe67d795f5af8d03599f1')
