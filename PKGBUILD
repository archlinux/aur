# Maintainer: skoriop <karthikp.ivy@gmail.com>

pkgname=btop-no-gpu
pkgver=1.4.0
pkgrel=5
pkgdesc="A monitor of system resources, bpytop ported to C++, compiled with GPU support disabled"
arch=(x86_64)
url="https://github.com/aristocratos/btop"
license=(Apache-2.0)
depends=(gcc-libs glibc)
makedepends=(lowdown)
conflicts=(btop)
_archive="btop-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ac0d2371bf69d5136de7e9470c6fb286cbee2e16b4c7a6d2cd48a14796e86650')

build() {
	cd "$_archive"
	make GPU_SUPPORT=false all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
