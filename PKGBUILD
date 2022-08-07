# Maintainer: Gregory Land
pkgname=supergfxctl
pkgver=4.0.5
pkgrel=3
pkgdesc="A utility for Linux graphics switching on Intel/AMD iGPU + nVidia dGPU laptops"
arch=('x86_64')
url="https://gitlab.com/asus-linux/supergfxctl"
license=('MPL2')
depends=('dbus')
makedepends=('rust' 'clang')
provides=('supergfxctl')
conflicts=('supergfxctl-git'
           'optimus-manager'
            'tlp')
source=("https://gitlab.com/asus-linux/supergfxctl/-/archive/$pkgver/supergfxctl-$pkgver.tar.gz")
sha512sums=('eeed34618ea9a9b7f974fc4ffd3eee8fc152b4e2974f51add7e2be622230f110550a7dc9f44acc389096c17453a93c3816251050763d727505f8f4aa89b55ba8')
_gitdir=${pkgname%"-git"}

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

