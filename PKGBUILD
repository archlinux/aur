# Maintainer: Félicien Pillot <felicien.pillot@member.fsf.org>
pkgname=make7libre
pkgver=0.8.6
pkgrel=2
pkgdesc="Free/libre block match puzzle game"
arch=('x86_64')
url="http://make7libre.nongnu.org"
license=('GPL3')
depends=('gtkmm3')
makedepends=('intltool' 'itstool')
changelog=ChangeLog
source=("http://download.savannah.gnu.org/releases/make7libre/${pkgname}-${pkgver}.tar.gz" "http://download.savannah.gnu.org/releases/make7libre/${pkgname}-${pkgver}.tar.gz.sig")
validpgpkeys=('0F4775FC247B70595AD7573513907AE74D527673')
md5sums=("fdf792b80a37c7dcf1fd11971af1a107" \
         "25acc5b64d6d291967556f2f7ce761fb")

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
