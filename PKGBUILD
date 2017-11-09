# Maintainer: lod <aur@cyber-anlage.de>
pkgname=libnss-extrausers
pkgver=0.6
pkgrel=2
pkgdesc="nss module to have an additional passwd, shadow and group file"
arch=('any')
url="https://anonscm.debian.org/cgit/collab-maint/libnss-extrausers.git/log/?h=debian"
license=('GPL')
makedepends=('gcc')
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

