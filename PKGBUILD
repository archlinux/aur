# Maintainer: Paul Frische <paul@paulfrische.xyz>
pkgname="paulfrische-dmenu-git"
pkgver="1.0.0"
pkgrel=1
pkgdesc="This is my build of dmenu using the grid patch and the tokyonight color scheme."
arch=("any")
url="https://github.com/paulfrische/dmenu"
license=("MIT")
makedepends=("make" "git")
provides=("dmenu")
conflicts=("dmenu")
replaces=("dmenu")
source=("https://github.com/paulfrische/dmenu/archive/refs/heads/main.zip")

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "dmenu-main"
	make
}

package() {
    cd "dmenu-main"
    make DESTDIR="$pkgdir/" install
}
sha256sums=('1eba59778628544ca8fc0a9c1f3a445a4519581c04e676e6a12927318f8fbdd2')
