# Maintainer: Félicien Pillot <felicien.pillot@member.fsf.org>
pkgname=make7libre
pkgver=0.8.4
pkgrel=1
pkgdesc="Free/libre block match puzzle game"
arch=('x86_64')
url="https://gitlab.com/felandral/make7libre"
license=('GPL3')
depends=('gtkmm3')
makedepends=('intltool')
changelog=ChangeLog
source=("https://gitlab.com/felandral/make7libre/raw/dist/${pkgname}-${pkgver}.tar.gz" "https://gitlab.com/felandral/make7libre/raw/dist/${pkgname}-${pkgver}.tar.gz.sig")
validpgpkeys=('0F4775FC247B70595AD7573513907AE74D527673')
md5sums=("c373eca8c215a75418a5f8add707e5cb" \
         "bc615f805a886084938dcbed9e71db17")

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
