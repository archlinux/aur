# Maintainer: lod <aur@cyber-anlage.de>
pkgname=libnss-extrausers
pkgver=0.6
pkgrel=3
pkgdesc="nss module to have an additional passwd, shadow and group file"
arch=('any')
url="https://packages.debian.org/de/source/sid/libnss-extrausers"
license=('GPL')
makedepends=('gcc')
conflicts=('libnss-extrausers-git')
source=(http://http.debian.net/debian/pool/main/libn/$pkgname/${pkgname}_$pkgver.orig.tar.gz)
sha256sums=('6a37c3cf6ff5dfd46b1b3127e1226404e43185fa73cd40e8144d5f7736eee9f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
