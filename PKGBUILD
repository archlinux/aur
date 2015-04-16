# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=gahshomar
pkgver=4.3.3
pkgrel=1
pkgdesc="A Persian (Jalali/Farsi) calendar"
arch=('any')
url="https://gahshomar.github.io/gahshomar/"
license=('GPL3')
replaces=('persian-calendar')
conflicts=('persian-calendar')
depends=('python-gobject' 'jcal-git' 'libpeas' 'gtk3' 'gsettings-desktop-schemas' 'yelp')
makedepends=('intltool' 'yelp-tools') # 'gobject-introspection'
optdepends=('libappindicator-gtk3: for the app indicator plugin'
			'gnome-shell: for the gnome-shell extension')
install=gahshomar.install
source=($pkgname-$pkgver.tar.gz::https://github.com/Gahshomar/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('2a2dd73e35c993a4d333befb225bc638')

build() {
	cd $srcdir/$pkgname-$pkgver
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="${pkgdir}" install
}
