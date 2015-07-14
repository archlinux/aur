# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Tony Crisci <tony@dubstepdish.com>
pkgname=playerctl
pkgver=0.4.2
pkgrel=1
pkgdesc="mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others."
arch=('i686' 'x86_64')
url="https://github.com/acrisci/playerctl"
license=('LGPL3')
depends=('glib2' 'gobject-introspection')
optdepends=('python-gobject')
source=("https://github.com/acrisci/playerctl/releases/download/v${pkgver}/playerctl-${pkgver}.tar.gz")
md5sums=("480ef14416607baa3d8bd8fe305d55d1")

build() {
    cd "$srcdir/playerctl-$pkgver"
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd "$srcdir/playerctl-$pkgver"
	make DESTDIR="$pkgdir/" install
}
