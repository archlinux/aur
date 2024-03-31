# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=minecraftd
pkgver=1.0.1
pkgrel=1
url="https://github.com/arcmags/${pkgname}"
pkgdesc='Minecraft server daemon script and unit files'
arch=(any)
license=(MIT)
depends=(bash minecraft-server-jar)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=(d00c4f0fb7f782fb21c1a43fb2a07633ae9561d1ede168c97ab37bff41c2d19d)
backup=(etc/minecraftd.conf)

# extra-x86_64-build -- -I <minecraft-server-jar pkg> -I <jre-openjdk-headless pkg>

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" PREFIX="${pkgdir}" install
}

# vim:ft=bash
