# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase="busybox"
pkgname="$_pkgbase-coreutils"
pkgver=1.36.0
pkgrel=3
pkgdesc="POSIX-compliant utility applets from BusyBox."
arch=('any')
url="https://busybox.net/"
license=('GPL')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(
	'awk'
	'busybox'
	'coreutils'
	'findutils'
	'inetutils'
	'gawk'
	'tar'
	'util-linux'
	'which'
)
conflicts=(
	'awk'
	'busybox'
	'coreutils'
	'findutils'
	'inetutils'
	'gawk'
	'tar'
	'util-linux'
	'which'
)
source=("https://busybox.net/downloads/$_pkgbase-$pkgver.tar.bz2")
sha256sums=("542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5")

prepare() {
	cd "$_pkgbase-$pkgver"
	make defconfig
}

build() {
	cd "$_pkgbase-$pkgver"
  make install
}

package() {
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/bin/" "$pkgdir/"
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/sbin/" "$pkgdir/"
}
