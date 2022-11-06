# Maintainer: OPGL <opgl@duck.com>
# Contributor: OPGL <opgl@duck.com>
pkgname=wpkg-cli
pkgver=1.3.1
pkgrel=1
pkgdesc='Access WPKG client!'
arch=('any')
license=("CUSTOM")
makedepends=()
depends=('java-environment>=17')
source=("https://wpkg.me/WPKG/CLI/Desktop/${pkgver}/WPKG-Cli-${pkgver}.jar"
	"wpkg-cli.desktop"
	"https://wpkg.me/WPKG/CLI/Desktop/wpkg-cli.svg")
sha256sums=("79724d8f6308487968805a4f27df7ce991837376233694ef7b8a9e984936830d"
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
