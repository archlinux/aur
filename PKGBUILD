# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
pkgname=freetuxtv
pkgver=0.6.8
pkgrel=1
pkgdesc="WebTV vlc player to watch tv/radio playlists on the internet"
arch=('i686' 'x86_64')
url="https://github.com/freetuxtv/freetuxtv"
license=('GPL3')
depends=('vlc' 'gtk3' 'sqlite' 'curl' 'libnotify' 'dbus-glib')
makedepends=('intltool')
conflicts=('freetuxtv-svn')

source=("https://github.com/freetuxtv/freetuxtv/releases/download/freetuxtv-0.6.8/freetuxtv-0.6.8.tar.gz")
sha1sums=('9160ae0061bb97834c736b61af8936bf9eb900fc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-gtk=3.0
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
