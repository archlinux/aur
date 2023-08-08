# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=doas-sudo-shim-minimal
pkgver=0.1.1
pkgrel=1
pkgdesc="A shim for the sudo command that utilizes doas (without man page compilation)"
arch=(any)
url="https://github.com/jirutka/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo)
depends=(awk doas sh)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/doas-sudo-shim/archive/v$pkgver.tar.gz")
sha256sums=('795762a05ecf016d5dc5f1392b447d324380320bc913826b9ccc10ed0cefe43d')

package() {
	cd "$srcdir/doas-sudo-shim-$pkgver" || exit 1
	make install-exec DESTDIR="$pkgdir" PREFIX=/usr
}
