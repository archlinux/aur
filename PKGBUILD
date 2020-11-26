# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=rajio_gtk
pkgver=0.3
pkgrel=1
pkgdesc="A radio program that focuses on Japanese radio"
arch=("x86_64")
url="https://github.com/Dotz0cat/rajio_gtk"
license=('GPL3')
depends=('gtk3' 'gstreamer' 'sqlite3' 'gst-plugins-good' 'gst-plugins-bad')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/rajio_gtk/archive/$pkgver.tar.gz)
md5sums=('66f9217fd13482f1305d09e693b35eb6') #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}