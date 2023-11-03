# Maintainer: Gregory Land
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>

pkgname=supergfxctl
pkgver=5.1.2
pkgrel=1
pkgdesc="A utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/supergfxctl"
license=('MPL2')
depends=('gcc-libs' 'systemd')
makedepends=('rust')
provides=('supergfxctl')
conflicts=('supergfxctl-git'
           'optimus-manager')
source=("https://gitlab.com/asus-linux/supergfxctl/-/archive/$pkgver/supergfxctl-$pkgver.tar.gz")
sha512sums=('3cc7246472dc14c4773f8644fc54bc00339e7628199d9ff54e45a76c70014b7a25f1fd50086fcfbf4d7b416c73736db67aac0e4b1b21d9ba46038bd5910773be')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

