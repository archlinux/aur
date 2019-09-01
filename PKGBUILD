# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.6.0
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
sha256sums=('fdb024117bbb3fcbffcda2cabe1627722bbcbedf11b736dbd3949aed01dddd59'
            '132f40971be1dd617b215df567227284e5750829a3e11061fe2bc3173df787ef')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "ignited-${pkgver}" "${pkgdir}/usr/bin/ignited"
}
