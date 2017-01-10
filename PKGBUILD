# Maintainer: Félicien Pillot <felicien.pillot@member.fsf.org>
pkgname=make7libre
pkgver=0.8
pkgrel=1
pkgdesc="Free/libre block match puzzle game"
arch=('x86_64')
url="https://gitlab.com/felandral/make7libre"
license=('GPL3')
depends=('gtkmm3')
makedepends=('intltool')
changelog=ChangeLog
source=("make7libre-0.8.tar.gz::https://gitlab.com/felandral/make7libre/raw/dist/${pkgname}-${pkgver}.tar.gz" \
        "make7libre-0.8.tar.gz.sig::https://gitlab.com/felandral/make7libre/raw/dist/${pkgname}-${pkgver}.tar.gz.sig")
validpgpkeys=('0F4775FC247B70595AD7573513907AE74D527673')
md5sums=("a2946e8b5a58f9483fae1331794a141e" \
         "3924029853c08881fb1b4e61e152f622")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
