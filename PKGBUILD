# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=minecraft-server-jar
pkgver=1.20.6
pkgrel=1
url='https://minecraft.net/'
pkgdesc='Official Minecraft server jar file'
arch=(any)
license=(custom)
depends=('java-runtime-headless>=16')
conflicts=()
_jarnonce='145ff0858209bcfc164859ba735d4199aafa1eea'
_jarurl="https://launcher.mojang.com/v1/objects/${_jarnonce}/server.jar"
source=("minecraft-server-${pkgver}.jar"::"${_jarurl}")
noextract=("minecraft-server.${pkgver}.jar")
sha256sums=(c6d01d018ca782e506f0ec60652d47fd565078be9122b625c1681bc86c29c7ec)

package() {
	install -Dm644 "minecraft-server-${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.${pkgver}.jar"
	ln -sf "minecraft-server.${pkgver}.jar" "${pkgdir}/usr/share/java/minecraft-server.jar"
}

# vim:ft=bash
