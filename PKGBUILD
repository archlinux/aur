# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=minecraft-server-jar
pkgver=1.21.4
pkgrel=1
url='https://minecraft.net/'
pkgdesc='Official Minecraft server jar file'
arch=(any)
license=(custom)
depends=('java-runtime-headless>=16')
conflicts=()
_jarnonce='4707d00eb834b446575d89a61a11b5d548d8c001'
_jarurl="https://launcher.mojang.com/v1/objects/${_jarnonce}/server.jar"
source=("minecraft-server-${pkgver}.jar"::"${_jarurl}")
noextract=("minecraft-server.${pkgver}.jar")
sha256sums=(1066970b09e9c671844572291c4a871cc1ac2b85838bf7004fa0e778e10f1358)

package() {
	install -Dm644 "minecraft-server-${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.${pkgver}.jar"
	ln -sf "minecraft-server.${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.jar"
}

# vim:ft=bash
