# Maintainer: Ainola
# Contributor: Guillem Rieu

pkgname=pam_encfs
pkgver=0.1.4.4
pkgrel=5
pkgdesc="A module to auto-mount encfs directories on login"
url="http://code.google.com/p/pam-encfs/"
arch=('x86_64')
depends=('pam' 'encfs')
backup=('etc/security/pam_encfs.conf')
license=('GPL2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pam-encfs/pam_encfs-$pkgver.tar.gz")
sha256sums=('ec3144d20e32f568e0cbce645e2525565b0f9307f7643436d98937d0c3d09f8e')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/usr" install
  install -Dm755 pam_encfs.conf -t "$pkgdir/etc/security/"
}
