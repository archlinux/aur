# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase="busybox"
pkgname="$_pkgbase-coreutils"
pkgver=1.36.0
pkgrel=4
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
	'bash'
	'busybox'
	'coreutils'
	'e2fsprogs'
	'findutils'
	'inetutils'
	'iputils'
	'kbd'
	'kmod'
	'gawk'
	'grep'
	'gzip'
	'iproute2'
	'procps-ng'
	'sed'
	'sh'
	'tar'
	'util-linux'
	'vi'
	'which'
)
conflicts=(
	'awk'
	'bash'
	'busybox'
	'coreutils'
	'e2fsprogs'
	'findutils'
	'inetutils'
	'iputils'
	'kbd'
	'kmod'
	'gawk'
	'grep'
	'gzip'
	'iproute2'
	'procps-ng'
	'sed'
	'tar'
	'util-linux'
	'vi'
	'which'
)
source=(
	"https://busybox.net/downloads/$_pkgbase-$pkgver.tar.bz2"
	".config"
)
sha256sums=(
  "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
  "8f0dacf0e79c5ce71f42bdc04e342a5bcfe11511ad2762a8876fd136e920b856"
)

prepare() {
	cp .config "$_pkgbase-$pkgver/.config"
}

build() {
	cd "$_pkgbase-$pkgver"
  make install
}

package() {
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/bin/" "$pkgdir/"
	cp -r "$srcdir/$_pkgbase-$pkgver/_install/sbin/" "$pkgdir/"
}
