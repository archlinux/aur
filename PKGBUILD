# Maintainer: Gregory Land

pkgname=supergfxctl
pkgver=4.0.4
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
sha512sums=('3a914ddc49087c6ae836707cf41f9533411d53ed42106cfe5684deb754ebec3be549dc1e26fd5357ecb87965ff97b93eeec082b8a2fa9f00e9fe77dc0d029d02')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

