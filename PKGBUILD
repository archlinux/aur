# Maintainer: Gregory Land
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>

pkgname=supergfxctl
pkgver=5.1.0
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
sha512sums=('2eeb57f18dd881ae0d013e25788657e5dfe09c6026882e6ffdb47cbd07d3332b74c9482895e684902484539eff2b82489dc3fc1838eabbf9137b0ff2eec5f4a0')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

