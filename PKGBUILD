# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=minecraft-server-jar
pkgver=1.20.4
pkgrel=1
url='https://minecraft.net/'
pkgdesc='Official Minecraft server jar file'
arch=(any)
license=(custom)
depends=('java-runtime-headless>=16')
conflicts=()
_jarnonce='8dd1a28015f51b1803213892b50b7b4fc76e594d'
_jarurl="https://launcher.mojang.com/v1/objects/${_jarnonce}/server.jar"
source=("minecraft-server-${pkgver}.jar"::"${_jarurl}")
noextract=("minecraft-server.${pkgver}.jar")
sha256sums=(c03fa6f39daa69ddf413c965a3a83084db746a7a138ce535a693293b5472d363)

package() {
	install -Dm644 "minecraft-server-${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.${pkgver}.jar"
	ln -sf "minecraft-server.${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.jar"
}

# vim:ft=bash
