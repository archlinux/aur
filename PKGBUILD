# Maintainer: Augustin deMayo <gus.demayo@gmail.com>

pkgname=jammr
pkgver=1.3.1
pkgrel=1
pkgdesc="Lets you jam together online. It is possible to play jam sessions with musicians around the world over the internet"
arch=('x86_64')
url='https://jammr.net/'
license=('GPL2')
depends=('hicolor-icon-theme' 'libogg' 'libvorbis' 'portaudio' 'portmidi' 'qtkeychain-qt5')
source=("https://github.com/wahjam/wahjam/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0544dd31ecd12ebcbf36069a46f686e626f2e1f6f1f1195097a2f13f1e4e8ded')

build() {
  cd wahjam-$pkgver
  qmake-qt5 CONFIG+='jammr qtclient'
  make
}

package() {
  cd wahjam-$pkgver
  make INSTALL_ROOT="$pkgdir/usr" install
}
