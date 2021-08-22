# Maintainer: Alberto Vicente <odintdh at gmail dot com>
pkgname=extremecooling4linux
pkgver=0.3.1
pkgrel=1
pkgdesc="Extreme cooling fan mode on Linux for Lenovo Legion laptops."
arch=("x86_64")
url="https://gitlab.com/OdinTdh/extremecooling4linux"
license=('GPL3')
depends=("python" "python-gobject" "python-portio")
optdepends=('indicator-extremecooling4linux: desktop indicator for ExtremeCooling4Linux')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/OdinTdh/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e14f1ac29ef05a25e3748cb164ba62b8f9be08a9a83f1a6e9b4f7ae47c3455a4')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/polkit-1/actions/
	mkdir -p $pkgdir/usr/share/locale/es/LC_MESSAGES/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/extremecooling4linux/
	mkdir -p $pkgdir/usr/share/pixmaps/
	mkdir -p $pkgdir/usr/share/metainfo/
	make DESTDIR="$pkgdir" install
}


