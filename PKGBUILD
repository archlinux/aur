# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Needs deps, maybe...
# find-libdeps *.zst | sed 's/=.*//' | xargs -n1 pacman -F | grep -v multi | awk -F'[/ ]' '/^\w/ { print $2 }' | sort | uniq

pkgname=ezra-bible-app-bin
pkgver=1.2.0
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
source=("$url/releases/download/$pkgver/${pkgname%-bin}_fedora33-$pkgver.rpm")
sha256sums=('a95d1d1c93ffb3d326671e07896028c807c3164a48da9397ed16bf6fed4f8481')

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
