# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
pkgname=telepathy-haze
pkgver=0.8.1
pkgrel=1
pkgdesc="A telepathy-backend to use libpurple (Pidgin) protocols."
arch=(x86_64)
url="http://telepathy.freedesktop.org"
license=(GPL)
depends=(telepathy-glib libpurple)
makedepends=(libxslt python)
groups=(telepathy)
source=(https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('704befa42eec2173eca4bac01ffd004014665f2bad46dc8948e5423364cde30a'
            'SKIP')
validpgpkeys=('AA33B0D27868E36C151780F0FE0B6D736B1195ED') # Alexandr Akulich

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/telepathy
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
