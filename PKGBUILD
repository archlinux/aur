# Maintainer: Frank Endres <frankendres@tuxfamily.org> - disabled, use first@last.fr

pkgname=adwaita-xfce-icon-theme
pkgver=0.0.4
pkgrel=1
pkgdesc="This icon theme is an extension for Adwaita fixing missing icons that are used in Xfce. It is not a complete theme and inherits the bulk of icons from Adwaita."
arch=('any')
url="https://github.com/shimmerproject/adwaita-xfce-icon-theme"
license=('GPL 3')
depends=('adwaita-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/shimmerproject/${pkgname}/tar.gz/refs/tags/${pkgver}")
sha256sums=('ded859d3c3f7ed91283c4fccc78a7446832852a47f385905d1879ab164cc5b30')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
