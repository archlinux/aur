# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.3
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
md5sums=('98c10e026e0653a67eb833755069f43f')
#noextract=("master.zip")
#md5sums=()
#validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    #cd "release2"
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
	install languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	mkdir -p $pkgdir/usr/share/applications/
	install reckel-cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    mkdir -p $pkgdir/usr/share/icons/
    install Cantara.png $pkgdir/usr/share/icons/cantara.png
}
