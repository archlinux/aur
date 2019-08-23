# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.5.1
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
sha256sums=('2f0e6bf8c0ec7ca4b078517afe993ddce81061562044a7eafd8bb3887ba74c03'
            '6632b1d432971189ed2f85990eb606d131d45940112bc1f987bbfc6bad85fe2d')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "ignited-${pkgver}" "${pkgdir}/usr/bin/ignited"
}
