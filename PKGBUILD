# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://github.com/reckel-jm/cantara"
license=('GPL3')
groups=()
depends=('qt5pas')
makedepends=('lazarus-qt5' 'qt5pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/archive/refs/tags/v$pkgver.zip")
md5sums=('f871696e8d2566f42671c4965e9da770')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	#make
	lazbuild -B Cantara.lpi --ws=qt5
}

package() {
	mkdir -p $pkgdir/usr/bin/
	#cd "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	install cantara $pkgdir/usr/bin/cantara
	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	install -D languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	install -D languages/zh/cantara.mo $pkgdir/usr/share/locale/zh/LC_MESSAGES/cantara.mo
	mkdir -p $pkgdir/usr/share/applications/
	install app.cantara.Cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    mkdir -p $pkgdir/usr/share/icons/
    install app.cantara.Cantara.png $pkgdir/usr/share/icons/app.cantara.Cantara.png
}
