# Maintainer: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Contributor: Bertrand Ciroux <bertrand.ciroux@gmail.com>
pkgname=blynk-server-bin
pkgver=0.41.0
pkgrel=2
pkgdesc="Blynk server for the Blynk IoT platform"
arch=('any')
url="https://www.blynk.cc/"
license=('GPL3')
depends=('java-runtime-headless>=10')

backup=('etc/blynk/server.properties')
install="${pkgname}.install"

source=("server-${pkgver}.jar::https://github.com/blynkkk/blynk-server/releases/download/v${pkgver}/server-${pkgver}.jar"
        "blynk.service"
	    "blynk-server-bin.install"
	    "server.properties")

noextract=("server-${pkgver}.jar")

sha256sums=("4283acf195ec75de6ba04ebb11d975f8dc3fb0cb72ed457c616443ad24de98ee"
	"9d3c4395d3a76fd26ae9c453ab89a54ea91f42fd06b9c7217c5b6f6f56f9530e"
	"220c68ca2f65904d66ab0791b726e733fcf9e9c7ad396b75678b96a4af9bb232"
	"fc825817a90f2d4ec5bef5d10733957289ce478e67c9f5fff09682e1bff4c655")

package() {
	install -d ${pkgdir}/{etc,usr/share,var/lib,var/log}/blynk
	install -Dm644 blynk.service "${pkgdir}/usr/lib/systemd/system/blynk.service"
	install -Dm644 server-${pkgver}.jar ${pkgdir}/usr/share/blynk/blynk-server.jar
	install -Dm644 server.properties ${pkgdir}/etc/blynk/
}
