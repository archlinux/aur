# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=minecraftd
pkgver=1.0.2
pkgrel=1
url="https://github.com/arcmags/${pkgname}"
pkgdesc='Minecraft server daemon script and unit files'
arch=(any)
license=(MIT)
depends=(bash minecraft-server-jar)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=(7d9d1d6fd5b603d7251662363633101fa79aa3ded5b402a4414dd522d7cbd7f8)
backup=(etc/minecraftd.conf)

# extra-x86_64-build -- -I <minecraft-server-jar pkg> -I <jre-openjdk-headless pkg>

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" PREFIX="${pkgdir}" install
}

# vim:ft=bash
