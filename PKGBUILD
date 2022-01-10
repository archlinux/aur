# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://github.com/reckel-jm/cantara"
license=('GPL')
groups=()
depends=('gtk2')
makedepends=('fpc' 'lazarus')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/archive/refs/tags/$pkgver.zip")
md5sums=('SKIP')
#noextract=("master.zip")
#md5sums=()
#validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cd "$pkgname-$pkgver"
	install cantara $pkgdir/usr/bin/cantara
	mkdir -p $pkgdir/usr/share/locale/en/
	install languages/cantara.en.mo $pkgdir/usr/share/locale/en/cantara.mo
	mkdir -p $pkgdir/usr/share/applications/
	install reckel-cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    mkdir -p $pkgdir/usr/share/icons/
    install Cantara.png $pkgdir/usr/share/icons/cantara.png
}
