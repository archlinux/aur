# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="mirror multi-arch container images & generate image-list for Rancher."
arch=("x86_64")
url="https://github.com/cnrancher/hangar"
license=("Apache")
depends=("skopeo")
makedepends=()
provides=()
source=(
    "https://github.com/cnrancher/hangar/releases/download/v$pkgver/hangar-linux-amd64-v$pkgver"
)
sha256sums=(
    "5789085576441ec01b12ebaab37ca051ba886f2b54e5d70b05d1f3ea2aafea44"
)

package() {
    cd $srcdir
	mv hangar-linux-amd64-v$pkgver hangar
    chmod +x hangar
    install -D -m755 hangar $pkgdir/usr/local/bin/hangar
}