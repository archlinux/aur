# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=q-dns-git
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=(x86_64)
url='https://github.com/natesales/q'
pkgrel=2
license=('GPL-3.0')
makedepends=('go' 'git')
source=('git+https://github.com/natesales/q')
md5sums=('SKIP')
provides=($pkgname)
conflicts=($pkgname)
pkgver=0.4.2.r7.g969a234

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
