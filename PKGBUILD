# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl-editor
pkgver=0.2.1
pkgrel=2
pkgdesc='General purpose, light-weight customizable editor'
arch=('i686' 'x86_64')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
install=howl-editor.install
source=(http://download.howl.io/release/howl-$pkgver.tgz)
md5sums=('8caf43a8631041677a4bc4df9c6c0f18')

build() {
  cd howl-$pkgver/src
  make
}

package() {
  make -C howl-$pkgver/src PREFIX=/usr DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
}
