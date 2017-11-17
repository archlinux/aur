# Maintainer: lod <aur@cyber-anlage.de>
pkgname=libnss-extrausers-git
_pkgname=libnss-extrausers
pkgver=r19.4705a9a
pkgrel=2
pkgdesc="nss module to have an additional passwd, shadow and group file"
arch=('any')
url="https://anonscm.debian.org/cgit/collab-maint/libnss-extrausers.git/"
license=('GPL')
makedepends=('git' 'gcc')
conflicts=('libnss-extrausers')
provides=('libnss-extrausers')
source=('git+https://anonscm.debian.org/git/collab-maint/libnss-extrausers.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

