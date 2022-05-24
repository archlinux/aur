# Maintainer: Jameson Pugh <imntreal@gmail.com> 

pkgname=spigot-plugin-essentialsx
pkgver=2.19.4
pkgrel=1
pkgdesc="EssentialsX offers 130 commands useful on just about every server, initial kits, mob spawning, economy, warps along the map, houses, etc."
arch=(any)
url="https://essentialsx.net"
license=("GPLv3")
depends=("craftbukkit>=1.9")
source=("https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsX-${pkgver}.jar"
        "https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsXChat-${pkgver}.jar"
        "https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsXSpawn-${pkgver}.jar"
        "https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsXAntiBuild-${pkgver}.jar"
        "https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsXGeoIP-${pkgver}.jar"
        "https://github.com/EssentialsX/Essentials/releases/download/${pkgver}/EssentialsXProtect-${pkgver}.jar")
sha256sums=('4d13a8a556f9695482c73693c6423fc5c029976fb17001d8d142a02debd0e22d'
            '352475f8917f2a96c23e6a4e1ec846a90ca4ede41d8dd7878f96a9b011c16c2a'
            '4d30ae58315f7640e9033518a54a03e28309c1cc656267c760710bd1ec3c016e'
            '50c18dadfea30a5f4871e74ae17ce0cf92b0f066c613a8f4d2fda2c12cd79017'
            '6d66c4f8a911a16d905c9979ac545c2dca1ddeb1ba40224c0916c123f8ddaf7f'
            '3f58b3980d7ec0f4b2f96ce395bafb303b3dda5ae4407f6ace236cccb692b9cf')
noextract=("EssentialsX-${pkgver}.jar"
           "EssentialsXChat-${pkgver}.jar"
           "EssentialsXSpawn-${pkgver}.jar"
           "EssentialsXAntiBuild-${pkgver}.jar"
           "EssentialsXGeoIP-${pkgver}.jar"
           "EssentialsXProtect-${pkgver}.jar")

package() {
  # Packaging and fixing owner
  cd "${srcdir}"
  find . -name '*.jar' -exec install -Dm664 {} "$pkgdir/srv/craftbukkit/plugins/"{} \;
  chown -R craftbukkit:craftbukkit $pkgdir/srv/craftbukkit/plugins/

  # Permissions to plugin folder for drag and drop
  chmod 777 $pkgdir/srv/craftbukkit/plugins/
  chmod 664 $pkgdir/srv/craftbukkit/plugins/*.jar
}

