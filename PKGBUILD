# Maintainer: Gregory Land
pkgname=supergfxctl
pkgver=4.0.5
pkgrel=1
pkgdesc="A utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/supergfxctl"
license=('MPL2')
depends=()
makedepends=('rust')
provides=('supergfxctl')
conflicts=('supergfxctl-git')
source=("https://gitlab.com/asus-linux/supergfxctl/-/archive/4.0.4/supergfxctl-$pkgver.tar.gz")
sha512sums=('f1caa88de37682b2d7b1169f54e07327b25e252a4ea959157ab566767644a45a2f20dd674132e76e264fff1ad528c5ad92c6178e4d27b8c1d6deb63b118fb017')
_gitdir=${pkgname%"-git"}

build() {
	#cd "$pkgname-$pkgver"
	cd "supergfxctl-4.0.4-7eabe91507764927768d2f48bac78b03fa8c77a9"
	make build
}

package() {
	#cd "$pkgname-$pkgver"
	cd "supergfxctl-4.0.4-7eabe91507764927768d2f48bac78b03fa8c77a9"
	make DESTDIR="$pkgdir" install
}

