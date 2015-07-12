# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=pam_encfs
pkgver=0.1.4.4
pkgrel=2
pkgdesc="pam_encfs is a module to auto mount encfs dir on login"
url="http://code.google.com/p/pam-encfs/"
arch=(i686 x86_64)
depends=('encfs')
backup=('etc/security/pam_encfs.conf')
license="GPL"
source=(http://pam-encfs.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('20d10fa842e968a224af542db7e10d21')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make DESTDIR=${pkgdir}/usr install || return 1
  mkdir -p $pkgdir/etc/security
  cp pam_encfs.conf $pkgdir/etc/security
}
