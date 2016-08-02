# Maintainer: SuperBo<supernbo@gmail.com>
pkgname=cloud-utils
pkgver=0.29
pkgrel=1
pkgdesc="A useful set of utilities for interacting with a cloud"
arch=('any')
url="https://launchpad.net/cloud-utils"
license=('GPL3')
groups=()
depends=(python qemu ca-certificates cdrkit e2fsprogs file util-linux wget)
optdepends=(gptfdisk euca2ools)
provides=(cloud-utils)
conflicts=(cloud-utils-bzr)
replaces=()
source=("https://launchpad.net/cloud-utils/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('9ea1b66f5a4798c8d6eeca48d908e11169a38e943efa433b7ec5dffa907e257c')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
