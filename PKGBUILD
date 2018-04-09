# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj at bk dot ru>

pkgname=kmflcomp
pkgver=0.9.10
pkgrel=1
pkgdesc="Keyboard Mapping for Linux (KMFL) compiler"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
depends=('libx11')
source=("https://sourceforge.net/projects/kmfl/files/kmfl/kmflcomp/kmflcomp-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('1190b897937b3bf25adb8a0f41969993')

build() {
	LDFLAGS="-Wl,-O1,--sort-common,-z,relro"
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

