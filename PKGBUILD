# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=q-dns-git
_shortpkgname=q-dns
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
url='https://github.com/natesales/q'
pkgrel=1
license=('GPL-3.0')
makedepends=('go' 'git')
source=('git+https://github.com/natesales/q')
md5sums=('SKIP')
provides=($_shortpkgname)
conflicts=($_shortpkgname)
pkgver=0.9.0.r2.g6029bf3

pkgver() {
	cd q
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd q
	go build
}

package() {
	cd q
	install -Dm755 q "$pkgdir/usr/bin/q"
}
