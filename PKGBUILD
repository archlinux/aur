pkgname=postgresql-debversion
pkgver=1.1.2
pkgrel=1
pkgdesc="Debian version number type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
depends=('postgresql>15' 'postgresql<16' 'apt')
source=("https://deb.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.bz2")
b2sums=('d76b065a3f852887b0e7631c4748a6d2edcd994f5b4b12501974c67a6587fa377ed2e86afd29f2dbbb195abcf94cdda7e43634b8c14507aa8b1f60a2351766f1')

build() {
  cd "$pkgname-v$pkgver"

  make
}

package() {
  cd "$pkgname-v$pkgver"

  make DESTDIR="$pkgdir" install
}
