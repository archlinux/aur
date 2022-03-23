# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Bastien Dejean <baskerville@lavabit.com>

pkgname=libunicodenames
pkgver=1.2.2
pkgrel=2
pkgdesc='Library for retrieving Unicode annotation data'
url='https://sourceforge.net/projects/sortsmill/files/libunicodenames/'
license=('GPL3')
arch=('x86_64')
depends=('bash')
optdepends=('awk')
makedepends=('wget' 'help2man')
source=("$pkgname-$pkgver.tar.xz::https://downloads.sourceforge.net/project/sortsmill/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1ae6002f89a15d6f7299f900eb6d3f5aecbe3661695b147f4b94a9639007f01c')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib
	make
}

check() {
	make -C "$pkgname-$pkgver" check
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir/" install
}
