# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.5.0
pkgrel=1
epoch=
pkgdesc="mirror multi-arch container images & generate image-list for Rancher."
arch=("x86_64")
url="https://github.com/cnrancher/hangar"
license=('Apache')
depends=("docker" "docker-buildx" "skopeo")
makedepends=()
provides=()
source=(
    "https://github.com/cnrancher/hangar/releases/download/v$pkgver/hangar-linux-amd64-v$pkgver"
)
sha256sums=(
    "5689eafd87a8a7a226224d4f86244f53c21ccb2938456f2bf537aa76fa34032c"
)

package() {
    cd $srcdir
	mv hangar-linux-amd64-v$pkgver hangar
    chmod +x hangar
    install -D -m755 hangar $pkgdir/usr/local/bin/hangar
}