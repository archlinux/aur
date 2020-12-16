# Mantainer: lxsycht <lux@systemli.org>
pkgname=metadata-cleaner
pkgdesc='Python GTK application to view and clean metadata in files, using mat2'
pkgver=v1.0.0
pkgrel=1
url='https://gitlab.com/rmnvgr/metadata-cleaner'
license=('GPL3')
arch=('x86_64')
depends=('gtk3' 'libhandy' 'python-gobject' 'python' 'mat2')
makedepends=('meson')
source=($pkgname-$pkgver.tar.gz::"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  meson --prefix=/usr "$pkgname-$pkgver" build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

