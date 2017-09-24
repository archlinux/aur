# Maintainer: Martin Schrodt <martin@schrodt.org>

pkgname=cubesql
pkgdesc='cubeSQL is a relational database management system built on top of the sqlite database engine.'
pkgver=5.6.1
pkgrel=1
arch=('x86_64')
url='http://www.sqlabs.com/cubesql.php'
license=('custom:cubesql')
depends=('')
optdepends=('gtk2' 'libgtkhtml')
_cubesql_ver=561
source=("http://www.sqlabs.com/download/cubesql/${_cubesql_ver}/cubesql_linux64bit.tgz" 'cubesql.service' 'cubesql-admin')
sha256sums=('ac83e3d8abee283fbaea8f1faf4c6178d7dfbefb466a337227fb03e7f05f4ee1' 'SKIP' 'SKIP')

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
 
