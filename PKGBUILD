# Maintainer: Eike Baran <eikebaran89@gmail.com>
pkgname=jdigitalsimulator
pkgrname=JDigitalSimulator
pkgver=2.2.0
pkgrel=1
pkgdesc="JDigitalSimulator is a platform independent open source Electronic Design Automation software entirely written in Java by Kristian Kraljic."
arch=('any')
url="http://kra.lc/projects/jdigitalsimulator/index.html"
license=('GPL3')
depends=('java-runtime>=7')
makedepends=('maven')
#changelog="$srcdir/$pkgrname-$pkgver/CHANGELOG.md"
#source=("https://github.com/kristian/$pkgrname/releases/download/$pkgver/jds-$pkgver.zip")
source=("https://github.com/kristian/$pkgrname/archive/refs/tags/$pkgver.zip")
md5sums=('0ee1ae6195ebdc1099c03033260d7265')

build() {
  cd "$srcdir/$pkgrname-$pkgver"
  mvn clean install
}

package() {

  install -D -m644 "$srcdir/$pkgrname-$pkgver/target/jds-$pkgver.jar" "$pkgdir/usr/share/java/JDigitalSimulator/jds.jar"
  install -D -m644 "$srcdir/$pkgrname-$pkgver/target/classes/lc/kra/jds/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/jdigitalsimulator.png"
  install -D -m755 "$startdir/JDigitalSimulator" "$pkgdir/usr/bin/JDigitalSimulator"
  install -D -m644 "$startdir/jdigitalsimulator.desktop" "$pkgdir/usr/share/applications/jdigitalsimulator.desktop"
  #make DESTDIR="$pkgdir/" install
}
