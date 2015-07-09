# Maintainer: Simeon Felis <simeonfelis@gmail.com>

pkgname=eekboard
pkgver=1.0.8
pkgrel=3
pkgdesc='Yet Another Virtual Keyboard for Gnome. http://blog.du-a.org/?cat=9'
arch=(i686 x86_64)
url='https://github.com/ueno/eekboard'
license=(GPL3)
depends=('gtk3' 'libxklavier' 'libcanberra')
makedepends=('intltool' 'gtk-doc')
optdepends=('ibus' 'clutter-gtk')
install=eekboard.install
source=("https://github.com/downloads/ueno/eekboard/eekboard-$pkgver.tar.gz")
sha512sums=(21ed54e7343db9566d268f1793ea19650eac2884cf5fe2b5647247d65956150017e9cbcbeab5f0e175677079559873abb6ac712099f9e5d635e1e792f0dce659)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
	  --prefix=/usr \
	  --sysconfdir=/etc \
	  --libexecdir=/usr/lib \
	  --enable-gtk-doc
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

