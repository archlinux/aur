# Contributor: Jed Liu <jed-archlinux@uma.litech.org>
pkgname=tmpreaper
pkgver=1.6.14
pkgrel=1
pkgdesc="Cleans up files in directories based on their age"
arch=('x86_64')
url="http://packages.debian.org/sid/tmpreaper"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.debian.org/debian/pool/main/t/tmpreaper/${pkgname}_${pkgver}.tar.gz)
noextract=()
sha512sums=('e78fab0cd2cc8c851e2806be70c102697bff86230e181bfad1c76b15fe5455fb431bc0dd16bebf77a2e9bb64b5f5a1474d24254ff780d4d72d343ea0e6e30ccb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
