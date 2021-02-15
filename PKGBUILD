# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Andrew Whatson <whatson@gmail.com>

pkgname=guile-curl
pkgver=0.9
pkgrel=1
pkgdesc='A GNU Guile library for client-side URL transfers based on libcurl'
arch=('x86_64')
license=('GPL3')
depends=('guile' 'curl')
url="https://github.com/spk121/guile-curl"
source=("https://github.com/spk121/guile-curl/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d241f27c2a6d2ac768ce1ae64fd27e6854b34ace6ce35ce810fb41a2a7b20ed6')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
