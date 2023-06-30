# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Needs deps, maybe...
# find-libdeps *.zst | sed 's/=.*//' | xargs -n1 pacman -F | grep -v multi | awk -F'[/ ]' '/^\w/ { print $2 }' | sort | uniq

pkgname=ezra-bible-app-bin
pkgver=1.11.0
pkgrel=1
pkgdesc='A user-friendly Bible study tool focussing on topical study based on keywords/tags'
arch=(x86_64)
url="https://github.com/${pkgname%-bin}/${pkgname%-bin}"
license=(GPL3)
depends=(curl
         expat
         glib2
         perl)
provides=("${pkgname%-bin}")
conflicts=("${provides[@]}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}_opensuse_leap_15.2-$pkgver.rpm")
sha256sums=('37300c5238fc6c757fdb5c0e3dd24d620eb40a8a915883f2882f7d07cd56a74e')

prepare() {
	rm -rf usr/lib/.build-id
}

build() {
	:
}

package() {
	install -dm0755 "$pkgdir"
	cp -ar usr "$pkgdir"
}
