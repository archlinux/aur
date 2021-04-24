# Maintainer: MelianMiko <mikigaru@zohomail.com>
pkgname=mibandpreview-git
pkgver=0.6
pkgrel=1
pkgdesc="Simple preview tool for Mi Band 4-6 watchfaces"
arch=(any)
url="https://melianmiko.ru/mibandpreview"
license=('Apache')
depends=(python-certifi python-watchdog python-pillow python-gobject python gtk3)
makedepends=(make intltool)
source=("$pkgname-$pkgver::git+https://gitlab.com/melianmiko/mibandpreview.git")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
