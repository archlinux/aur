# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui-bin
_pkgname=jd-gui
pkgver=1.1.0
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

md5sums=('6a8279ae32b5f4ece91b174081a04254')
sha1sums=('a62fc42948ec88140260e3c15ecfc4004947a11a')
sha256sums=('474408cf58cce69f5da4326198cdaacc5e35a36888c4f1b39a57323ef2e50ba4')
