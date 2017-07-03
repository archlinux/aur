# Maintainer: Eike Baran <eikebaran89@gmail.com>
pkgname=jdigitalsimulator
pkgver=2.0.2
pkgrel=1
pkgdesc="JDigitalSimulator is a platform independent open source Electronic Design Automation software entirely written in Java by Kristian Kraljic."
arch=('any')
url="http://kra.lc/projects/jdigitalsimulator/index.html"
license=('GPL3')
depends=('java-runtime>=7')
makedepends=('maven')
#changelog="$srcdir/$pkgname/CHANGELOG.md"
source=("$pkgname::git+https://github.com/kristian/JDigitalSimulator.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  mvn clean install
}

package() {
  install -D -m644 "$srcdir/$pkgname/target/jds-$pkgver.jar" "$pkgdir/usr/share/java/JDigitalSimulator/jds.jar"
  install -D -m755 "$startdir/JDigitalSimulator" "$pkgdir/usr/bin/JDigitalSimulator"
  install -D -m644 "$srcdir/$pkgname/target/classes/lc/kra/jds/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/jdigitalsimulator.png"
  install -D -m644 "$startdir/jdigitalsimulator.desktop" "$pkgdir/usr/share/applications/jdigitalsimulator.desktop"
  #make DESTDIR="$pkgdir/" install
}
