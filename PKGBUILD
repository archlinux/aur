# Maintainer: Genstar <genstar@disroot.org>
pkgname=ipxgw-git
pkgver=r20.dd9db85
pkgrel=1
pkgdesc="DOSBox IPXNET to real IPX network gateway"
arch=('x86_64')
url="https://github.com/jsalin/ipxgw"
license=('GPL2')
depends=('libpcap' 'sdl' 'sdl_net')
makedepends=('git')
provides=('ipxgw')
conflicts=('ipxgw')
source=("${pkgname%}::git+https://github.com/jsalin/ipxgw.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%}"
	make
}

package() {
	cd "$srcdir/${pkgname%}"
	install -Dm555 ipxgw "$pkgdir/usr/bin/ipxgw"
}
