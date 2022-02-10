# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=ictree
pkgver='1.0'
pkgrel=1
pkgdesc="Like tree but interactive"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/NikitaIvanovV/ictree"
license=('GPL3')
depends=('glibc')
optdepends=('xsel: for copying selected item into X clipboard' 'wl-clipboard: for copying selected item into Wayland clipboard')
source=("$url/releases/download/v$pkgver/ictree-v$pkgver.tar.gz")
sha256sums=('b9bebd09eb0f24ee8ece9fceabf540ac1ba852e57c47c8f80f3c99e395e6b800')

build() {
	cd "$pkgsrc"
	make
}

package() {
	cd "$pkgsrc"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
