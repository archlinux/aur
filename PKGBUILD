# Maintainer: Javier Fernández (WyRe) <WyRe12 at gmail dot com>
# Contributer: WyRe

pkgname=spigot-plugin-essentials
epoch=1
pkgver=2.0.1
pkgrel=2
pkgdesc="Essentials offers about 100 commands useful on just about every server, initial kits, mob spawning, economy, warps along the map, houses, etc."
arch=(any)
url="https://www.spigotmc.org/resources/essentialsx.9089/"
license=("GPLv3")
depends=("craftbukkit>=1.9")
source=("https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/Essentials/target/EssentialsX-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsAntiBuild/target/EssentialsXAntiBuild-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsXChat-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsGeoIP/target/EssentialsXGeoIP-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsProtect/target/EssentialsXProtect-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsXSpawn-$pkgver.jar"
"https://ci.drtshock.net/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsXMPP/target/EssentialsXXMPP-$pkgver.jar")
noextract=("EssentialsX-$pkgver.jar"
"EssentialsXAntiBuild-$pkgver.jar"
"EssentialsXChat-$pkgver.jar"
"EssentialsXGeoIP-$pkgver.jar"
"EssentialsXProtect-$pkgver.jar"
"EssentialsXSpawn-$pkgver.jar"
"EssentialsXXMPP-$pkgver.jar")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir"
  find . -name '*.jar' -exec install -Dm644 {} "$pkgdir/srv/craftbukkit/plugins/"{} \;
  chown -R craftbukkit:craftbukkit $pkgdir/srv/craftbukkit/plugins/
  chmod 755 $pkgdir/srv/craftbukkit/plugins/*.jar
}
