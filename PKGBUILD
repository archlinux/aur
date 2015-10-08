# Maintainer: DeaDDooMER <deaddoomer@deadsoftware.ru>
pkgname=gpcp-patched-jvm
pkgver=1.3.18rc
pkgrel=1
pkgdesc="Gardens Point Component Pascal"
url="https://gpcp.codeplex.com"
arch=('any')
license=('BSD')
makedepends=('git')
depends=('java-runtime')
conflicts=('gpcp-jvm')
source=("git+https://github.com/DeaDDooMER/gpcp-linux.git" "cprun" "j2cps")
md5sums=('SKIP' '38aee573d8e2dc342f8bfab7abf0a9a2' '6234ff1df2bdcf514caf0422ea3f10d9')

build() {
  cd ${srcdir}/gpcp-linux
  echo "Commit $(git describe --always)"
}

package() {
  cd ${srcdir}/gpcp-linux
  
  install -d $pkgdir/usr/share/java/gpcp-JVM
  cp -R out/* $pkgdir/usr/share/java/gpcp-JVM
  chmod -R 755 $pkgdir/usr/share/java/gpcp-JVM

  install -Dm755 $srcdir/cprun $pkgdir/usr/bin/cprun
  install -Dm755 $srcdir/j2cps $pkgdir/usr/bin/j2cps
}
