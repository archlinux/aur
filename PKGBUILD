# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui-bin
_pkgname=jd-gui
pkgver=1.2.0
pkgrel=1
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
provides=('jd-gui')
conflicts=('jd-gui')
source=("https://github.com/java-decompiler/jd-gui/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar")

package() {
	cd "$srcdir"
  install -Dm644 "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$_pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}

sha1sums=('b11d8c05d003502dcbb6162d3e8f59b48ac17cd9')
sha256sums=('a17e5feb54acfadeab249ce6c1e5254b92e813a1fe6d5f8ea86a01a56bc656ff')
md5sums=('f91f0bb76bd1995a11b259d7bc8bfbf4')
