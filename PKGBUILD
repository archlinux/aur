# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libisocodes
pkgver=1.2.5
pkgrel=1
epoch=
pkgdesc="Easily access XML data of the iso-codes package"
arch=('x86_64')
url="https://github.com/toddy15/libisocodes"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'libgee'
  'libxml2'
)
makedepends=(
  'gobject-introspection'
  'vala'
)
#checkdepends=('iso-codes')
provides=('libisocodes.so=1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cbf299de4a6ebf9e0f0cab437c1d2844c603fa479a56dbb83cee3b6684f5dc53')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$pkgname-$pkgver"
#  make -k check  ## TODO
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
