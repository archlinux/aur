# Maintainer: David Runge <dave@sleepmap.de>
pkgname=avldrums.lv2
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple Drum Sample Player Plugin, dedicated to the AVLinux Drumkits"
arch=('x86_64')
url="https://x42-plugins.com/x42/x42-avldrums"
license=('GPL2')
groups=('pro-audio' 'lv2-plugins')
depends=('cairo' 'glu' 'pango')
makedepends=('glib2' 'lv2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/x42/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha512sums=('c31318f7f6e92c94249282c449ff89153304d2bb3f13778f648d8e6d774c61c231acb9aff39add99ae765c95f61e7b03f52410d03fecf05b01b2b2f84a97d6f3')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
