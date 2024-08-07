# Maintainer: Whidix

pkgname=mksusecd
pkgver=2.19
pkgrel=2
pkgdesc="Script to create a SUSE installation ISO image."
arch=(x86_64 aarch64)
url="https://github.com/openSUSE/mksusecd"
license=()
makedepends=(
  asciidoc
)
depends=('checkmedia>=6.3-1')
provides=("mksusecd=${pkgver}")
conflicts=(mksusecd)
source=(
 "https://github.com/openSUSE/mksusecd/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  de1e7b6180f8cc918c93d208e08f7265de6589da9d9dc65f673f7be49e582f66
)

build() {
	cd "$pkgname-$pkgver"
  make mksusecd VERSION="$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"  VERSION="$pkgver" install
}
