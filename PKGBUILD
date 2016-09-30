# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=cubesql
pkgdesc='cubeSQL is a relational database management system built on top of the sqlite database engine.'
pkgver=5.5.0
pkgrel=1
arch=('x86_64')
url='http://www.sqlabs.com/cubesql.php'
license=('custom:cubesql')
depends=('')
optdepends=('lib32-gtk2')
_cubesql_ver=550
source=("http://www.sqlabs.com/download/cubesql/${_cubesql_ver}/cubesql_linux64bit.tgz" 'cubesql.service' 'cubesql-admin')
sha256sums=('edc4a319269b33ef87a6070874b95b6998a00a7ddf57c4f04a477fa0ef2fe32c' 'SKIP' 'SKIP')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/cubesql
  mkdir -p $pkgdir/usr/lib/cubesql
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/var/lib/cubesql
  
  cp cubesql.service $pkgdir/usr/lib/systemd/system
  install -m 755 cubesql-admin $pkgdir/usr/bin/cubesql-admin
    
  cd $srcdir/cubesql/data
  cp core/Linux/cubesql $pkgdir/usr/bin/cubesql
  cp documentation/* $pkgdir/usr/share/doc/cubesql
  
  cp -r admin/Linux/cubeSQLAdmin/* $pkgdir/usr/lib/cubesql
}
 
