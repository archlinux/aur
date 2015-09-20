# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui-bin
_pkgname=jd-gui
pkgver=1.4.0
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

md5sums=('fb2fc7abba5deb472ed3ee4b0fa5ac13')
sha1sums=('35bec04dcf240d915da97f7a6522288155725163')
sha256sums=('bdd2f3dc8750910e0d69378482cff57f2ff29d23983d1e55d266390527bd6b67')
sha512sums=('04f59d0ec974009ca5141f7f7229862d8e084f7ecc5685825e2fa10c8539c56f5a81252f3c80e344453c75050b8fa0dc5fd5cb6b4bb9c6b845bac86ed31899e0')
