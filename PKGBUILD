# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl-editor
pkgver=0.3
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=('i686' 'x86_64')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
install=howl-editor.install
source=(https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz)
md5sums=('30014d5a9d6adda87c8f0048afc25893')

build() {
  cd howl-$pkgver/src
  make
}

package() {
  make -C howl-$pkgver/src PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 howl-$pkgver/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
}
