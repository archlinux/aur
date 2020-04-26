# Contributor: Jed Liu <jed-archlinux@uma.litech.org>
pkgname=tmpreaper
pkgver=1.6.14+nmu1
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
sha512sums=('0109665ba2a6c076944e85462946aa743b67912886524820bc6107f17aa3576ea8759675aa91f6ec4c6b70d306bd172dfea2dff0000641c52f36dede75c2033a')

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
