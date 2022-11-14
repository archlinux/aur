# Maintainer: OPGL <opgl@duck.com>
# Contributor: OPGL <opgl@duck.com>
pkgname=wpkg-cli
pkgver=1.4.0
pkgrel=1
pkgdesc='Access WPKG client!'
arch=('any')
license=("CUSTOM")
makedepends=()
depends=('java-environment>=17')
source=("http://opgl.ct8.pl/WPKG/CLI/Desktop/${pkgver}/WPKG-Cli-${pkgver}.jar"
	"wpkg-cli.desktop"
	"http://opgl.ct8.pl/WPKG/CLI/Desktop/wpkg-cli.svg")
sha256sums=("f72e36f07fc1c85027d67df90801838c5532f8c9d335b0b49f8ce61a12a1e878"
	"3590b04974e3af397c9dd480f9f355fd9ff9de3ffdd3c0022272745242642059"
	"3f44b637b6155fbe4627009df8e98809621a062b5c0390e23674938ae9180a29")

prepare(){
    echo '#!/usr/bin/java -jar' | cat - WPKG-Cli-${pkgver}.jar > temp && mv temp WPKG-Cli-${pkgver}.jar
}
package() {
    install -Dm755 "WPKG-Cli-${pkgver}.jar" "$pkgdir/usr/bin/wpkg-cli"
    install -Dm644 "wpkg-cli.desktop" "$pkgdir/usr/share/applications/wpkg-cli.desktop"
    install -Dm644 "wpkg-cli.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wpkg-cli.svg"
}
