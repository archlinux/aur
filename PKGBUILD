# A PAM module allowing authentication via an /etc/passwd-like file
# Contributor: Mark Dovermann <mdovermann@ceruleanmicrosystems.com>
# Contributor: David Rosenstrauch <darose@darose.net>
# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>

pkgname=pam_pwdfile
pkgver=1.0
pkgrel=1
pkgdesc="A PAM module allowing authentication via an /etc/passwd-like file"
arch=('i686' 'x86_64')
url="https://github.com/tiwe-de/libpam-pwdfile"
license=('GPL')
groups=()
depends=('pam')
source=(https://github.com/tiwe-de/libpam-pwdfile/archive/v${pkgver}.tar.gz)
sha1sums=('a5fd2bd79a3c781b508905709450427f1b28705f')

build() {
  cd "$srcdir/libpam-pwdfile-${pkgver}"

  make
}

package() {
  cd "$srcdir/libpam-pwdfile-${pkgver}"

  make PAM_LIB_DIR="$pkgdir/usr/lib/security" INSTALL=$(which install) install
}
