# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.4.1
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
    "7f3a46a23fde15ad2a9632ba01fb0b790a718aeb5364ceaeccdfa9bbc98957bf"
)

package() {
    cd $srcdir
	mv hangar-linux-amd64-v$pkgver hangar
    chmod +x hangar
    install -D -m755 hangar $pkgdir/usr/local/bin/hangar
}