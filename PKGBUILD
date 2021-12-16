# Maintainer: Javier Fernández <jfernandz1290[at]gmail[dot]com> 

pkgname=spigot-plugin-essentials
epoch=1
pkgver=2.19.3
_build=1
_commit=05ce11f
pkgrel=1
pkgdesc="Essentials offers about 100 commands useful on just about every server, initial kits, mob spawning, economy, warps along the map, houses, etc."
arch=(any)
url="https://www.spigotmc.org/resources/essentialsx.9089/"
license=("GPLv3")
depends=("craftbukkit>=1.9")
source=("https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsX-$pkgver-dev+$_build-$_commit.jar"
"https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsXAntiBuild-$pkgver-dev+$_build-$_commit.jar"
"https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsXChat-$pkgver-dev+$_build-$_commit.jar"
"https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsXGeoIP-$pkgver-dev+$_build-$_commit.jar"
"https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsXProtect-$pkgver-dev+$_build-$_commit.jar"
"https://ci.ender.zone/job/EssentialsX/lastStableBuild/artifact/jars/EssentialsXSpawn-$pkgver-dev+$_build-$_commit.jar")
noextract=("EssentialsX-$pkgver.jar"
"EssentialsXAntiBuild-$pkgver.jar"
"EssentialsXChat-$pkgver.jar"
"EssentialsXGeoIP-$pkgver.jar"
"EssentialsXProtect-$pkgver.jar"
"EssentialsXSpawn-$pkgver.jar")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Packaging and fixing owner
  cd "$srcdir"
  find . -name '*.jar' -exec install -Dm664 {} "$pkgdir/srv/craftbukkit/plugins/"{} \;
  chown -R craftbukkit:craftbukkit $pkgdir/srv/craftbukkit/plugins/

  # Permissions to plugin folder for drag and drop
  chmod 777 $pkgdir/srv/craftbukkit/plugins/
  chmod 664 $pkgdir/srv/craftbukkit/plugins/*.jar
}

