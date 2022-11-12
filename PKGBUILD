# Maintainer: Gregory Land
pkgname=supergfxctl
pkgver=5.0.1
pkgrel=1
pkgdesc="A utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/supergfxctl"
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
provides=('supergfxctl')
conflicts=('supergfxctl-git'
           'optimus-manager')
source=("https://gitlab.com/asus-linux/supergfxctl/-/archive/$pkgver/supergfxctl-$pkgver.tar.gz")
sha512sums=('de2658a769b2d0d2a4999b9c5f307c80f78797098ec7ef990d32d717dbde4f83ed0d7df22c33677699c1208593d918c3354eac6aee7319c2bda25168c71c4fe6')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

