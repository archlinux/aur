# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-voice-server
pkgver=1.0.0
pkgrel=1
pkgdesc="Stores voicegrams and serves them for listening. Includes gnome-voice-send. Needs GLib 2.66 or newer."
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Voice"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://gnomevoice.org/src/gnome-voice-server-1.0.0.tar.xz)
sha256sums=('0f6f38ec5b882758308712de44fd627ecd3ddebd7a294b7847e840b3a7dfd41b')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check(){
  cd $pkgname-$pkgver
  make check -k
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

