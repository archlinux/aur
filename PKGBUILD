# Maintainer: Stavros Polymenis <sp@orbitalfox.com>
pkgname=portal
pkgver=0.1.0
pkgrel=1
pkgdesc="A personal portal system"
arch=(any)
url="http://orbitalfox.com"
license=('LGPL3')
groups=()
depends=()
makedepends=()
optdepends=(postfix dovecot nginx)
provides=("portal")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$portal::git+https://github.com/orbifx/portal.git")
noextract=()
sha512sums=(skip) #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
