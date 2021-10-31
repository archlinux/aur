# Contributor: Jed Liu <jed-archlinux@uma.litech.org>
pkgname=tmpreaper
pkgver=1.6.14+nmu2
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
sha512sums=('694dad36351aa52a375d6070caad135fe5f3bd3ebac95a68f9f789c04a03f163401c7f42111beb0f34a27725ff22b5cd063910c04f771997980346e212f3f2f9')

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
