# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=cubesql
pkgdesc='cubeSQL is a relational database management system built on top of the sqlite database engine.'
pkgver=5.7.2
pkgrel=1
arch=('x86_64')
url='http://www.sqlabs.com/cubesql.php'
license=('custom:cubesql')
optdepends=('gtk2' 'libgtkhtml')
_cubesql_ver=571
source=("http://www.sqlabs.com/download/cubesql/${_cubesql_ver}/cubesql_linux64bit.gz" 'cubesql.service' 'cubesql-admin')
sha256sums=('ae99e1580426b2ca022f10c7f61d514bf326b34c428685efbb4a744cbbe4115d' 'SKIP' 'SKIP')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/cubesql
  mkdir -p $pkgdir/usr/lib/cubesql
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/var/lib/cubesql
  
  cp cubesql.service $pkgdir/usr/lib/systemd/system
  install -m 755 cubesql-admin $pkgdir/usr/bin/cubesql-admin
    
  cd $srcdir/cubesql_64bit/data
  cp cubesql $pkgdir/usr/bin/cubesql
  cp Documentation/* $pkgdir/usr/share/doc/cubesql
  
  cp -r cubeSQLAdmin/* $pkgdir/usr/lib/cubesql
}
 
