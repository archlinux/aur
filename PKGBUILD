# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=text-engine
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight rich-text framework for GTK"
arch=('x86_64')
url="https://github.com/mjakeman/$pkgname"
license=('MIT')
depends=('gtk4' 'json-glib' 'libadwaita' 'libxml2')
makedepends=('cmake' 'meson')
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('5e515d7c7ca73df0239c9badf12d80846aa1479c6e084fd8c791881e17db540d')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
