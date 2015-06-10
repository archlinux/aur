# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
pkgname=freetuxtv
pkgver=0.6.6
pkgrel=2
pkgdesc="WebTV player to watch ADSL TV on the PC."
arch=('i686' 'x86_64')
url="http://code.google.com/p/freetuxtv/"
license=('GPL3')
install=freetuxtv.install
depends=('vlc' 'gtk3' 'sqlite' 'curl' 'libnotify')
makedepends=('intltool')
conflicts=('freetuxtv-svn')

source=("http://freetuxtv.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha1sums=('6c42778d65bf20b7aeb70614c696d6736d0fa5cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-gtk=3.0
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
