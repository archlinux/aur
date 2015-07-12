# Maintainer: Ainola
# Contributor: Guillem Rieu

pkgname=pam_encfs
pkgver=0.1.4.4
pkgrel=3
pkgdesc="A module to auto-mount encfs directories on login"
url="http://code.google.com/p/pam-encfs/"
arch=('i686' 'x86_64')
depends=('pam' 'encfs')
backup=('etc/security/pam_encfs.conf')
license=('GPL2')
source=("http://pam-encfs.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec3144d20e32f568e0cbce645e2525565b0f9307f7643436d98937d0c3d09f8e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install
  mkdir -p "${pkgdir}/etc/security"
  cp pam_encfs.conf "${pkgdir}/etc/security"
}
