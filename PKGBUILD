# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpssacli
pkgver=2.40_13.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
replaces=(hpacucli)
groups=(hpproliant)
license=("CUSTOM")

# hp doen't release the same versions for both archs sometimes
_i686ver=2.30_6.0

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${_i686ver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('2b25b8bf0ad69ac0b400a261dc256eced26a23a1bf838b4b65d3ce1530e9c3e0')
sha256sums_x86_64=('1e17602dec56f30dfe9329eb5ea060ac0dbb42ea003a27e8eecaa2148b331599')

package() {
	mv usr/{sbin,bin}
	cp -a opt usr "$pkgdir"
}
