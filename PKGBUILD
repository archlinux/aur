# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Weaveworks Ignite, combines Firecracker MicroVMs with Docker/OCI images to unify containers and VMs."
arch=('x86_64')
url="https://github.com/weaveworks/ignite"
license=('apache')
provides=('ignite')
source=(
	"ignite-${pkgver}::https://github.com/weaveworks/ignite/releases/download/v${pkgver}/ignite-amd64"
	"ignited-${pkgver}::https://github.com/weaveworks/ignite/releases/download/v${pkgver}/ignited-amd64"
)
noextract=(
	"ignite-${pkgver}"
	"ignited-${pkgver}"
)
sha256sums=('db67a0db64b5dfcf41f4061477b968547a85a58fb23b065d29b10cdc56585697'
            'd209a4b0d44bf44d3ce6e9a388bcce53762913bb0345955616c9b3a5a6eaacba')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "ignited-${pkgver}" "${pkgdir}/usr/bin/ignited"
}
