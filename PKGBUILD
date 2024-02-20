# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Needs deps, maybe...
# find-libdeps *.zst | sed 's/=.*//' | xargs -n1 pacman -F | grep -v multi | awk -F'[/ ]' '/^\w/ { print $2 }' | sort | uniq

pkgname=ezra-bible-app-bin
pkgver=1.12.0
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
sha256sums=('b78dddf5f5258c380705ff7ac101ffd3fd869182182d3120f8c2df95c3143af7')

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
