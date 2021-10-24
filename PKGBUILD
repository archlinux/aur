# Maintainer: Zitro <com dot proton mail at u4595650016>

pkgname=ifodump
pkgdesc="Dump iFO data from dvd disk"
pkgver=0.0.1
pkgrel=0
depends=("libdvdread")

url="https://sourceforge.net/projects/dvd/files/ifodump"
source=("https://downloads.sourceforge.net/project/dvd/ifodump/ifodump/ifodump-0.0.1.tar.gz" "dvdread.patch")
sha256sums=(
	"83c4cdedee0a0f4fd15aa319b317b94cbc8cd71fd756ce3baeaee9818b1faa41"
	"4efb985aebb813e701bcc28ede3a96f823474d4f54a1443ac55f78666f407b5f"
)

license=("GPL2")
arch=(any)

prepare() {
	cd $pkgname-$pkgver
	patch -p1 -i ../dvdread.patch
}

build() {
	cd $pkgname-$pkgver
	./autogen.sh
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
