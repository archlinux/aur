# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=gahshomar
pkgver=5.0.0.rc1
pkgrel=0
pkgdesc="A Persian (Jalali/Farsi) calendar"
arch=(i686 x86_64)
url="https://gahshomar.github.io/gahshomar/"
license=('GPL3')
replaces=('persian-calendar')
conflicts=('persian-calendar')
depends=('python-gobject' 'libappindicator-gtk3')
makedepends=('meson' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection')
optdepends=('gnome-shell: for the gnome-shell extension')
install=gahshomar.install
source=($pkgname-$pkgver.tar.gz::https://github.com/Gahshomar/gahshomar/archive/v$pkgver.tar.gz)
md5sums=('1556d5a7277c17c70fe11b661a1415f0')

build() {
	cd $srcdir/$pkgname-$pkgver
	meson --prefix /usr --buildtype=plain . build
	ninja -C build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    DESTDIR="$pkgdir" ninja -C build install
}
