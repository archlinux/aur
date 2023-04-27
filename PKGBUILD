# Maintainer: Gregory Land
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-com>

pkgname=supergfxctl
pkgver=5.1.1
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
sha512sums=('1c9e791450de5694b5ce28a90ffdd5b2f0412f1d29dfa651a88cab607cdac0b0f75595c70b6bff854d245754348c123fd2369ed61b191464f80be24ae519da1e')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

