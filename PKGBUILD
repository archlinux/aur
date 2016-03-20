# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Tony Crisci <tony@dubstepdish.com>
pkgname=playerctl
pkgver=0.5.0
pkgrel=1
pkgdesc="mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others."
arch=('i686' 'x86_64')
url="https://github.com/acrisci/playerctl"
license=('LGPL3')
depends=('glib2' 'gobject-introspection')
optdepends=('python-gobject: python bindings')
makedepends=('autoconf' 'gtk-doc')
source=("playerctl-${pkgver}.tar.gz::https://github.com/acrisci/playerctl/archive/v${pkgver}.tar.gz")
md5sums=('1c6059978ca08c32d9f991fdccb30f6f')

build() {
    cd "$srcdir/playerctl-$pkgver"
    NOCONFIGURE=true ./autogen.sh
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd "$srcdir/playerctl-$pkgver"
	make DESTDIR="$pkgdir/" install
}
