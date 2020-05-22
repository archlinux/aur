# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=qdl-git
pkgver=760b3dffb03d2b7dfb82c6eac652a092f51c572d
pkgrel=0
pkgdesc="This tool communicates with USB devices of id 05c6:9008 to upload a flash loader and use this to flash images"
arch=(any)
url="https://git.linaro.org/landing-teams/working/qualcomm/qdl.git"
license=(GPL)
depends=('libxml2')
source=("git://git.linaro.org/landing-teams/working/qualcomm/qdl.git")
sha512sums=('SKIP')

prepare() {
	cd qdl
	git reset --hard $pkgver
}

build() {
	cd qdl
	make
}

package() {
	cd qdl
	make DESTDIR="$pkgdir" install
}
