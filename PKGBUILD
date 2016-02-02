# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=4.5.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${pkgver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('3a15e2d8e71cd4af2de934d3386b5308ec7fdb023ec4838494dfd246db54921e')
sha256sums_x86_64=('43d9b808a05d67ce57da3fb0b58d67a428af489242c606c89f9293435a203772')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	[ -d lib64 ] && mv lib64 lib
}
