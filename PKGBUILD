# Maintainer: zoe <chp321 AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=arch-backup
pkgver=0.8.9
pkgrel=5
pkgdesc="trivial backup scripts (ssh/smb support)"
arch=(any)
url="http://code.google.com/p/archlinux-stuff/"
license=("GPL")
depends=()
backup=(etc/arch-backup/arch-backup.conf)
source=(http://archlinux-stuff.googlecode.com/files/arch-backup-$pkgver.tar.gz)
md5sums=('9614e4206f72264142ab3f4cb74d458b')

package() {
  install -D -m 0644 $srcdir/arch-backup-$pkgver/arch-backup.conf \
		     $pkgdir/etc/arch-backup/arch-backup.conf
  install -D -m 0755 $srcdir/arch-backup-$pkgver/arch-backup.sh \
		     $pkgdir/usr/bin/arch-backup
  install -D -m 0755 $srcdir/arch-backup-$pkgver/ssh-backup.sh \
		     $pkgdir/usr/lib/arch-backup/ssh
  install -D -m 0755 $srcdir/arch-backup-$pkgver/smb-backup.sh \
		     $pkgdir/usr/lib/arch-backup/smb
  install -D -m 0755 $srcdir/arch-backup-$pkgver/local-backup.sh \
		     $pkgdir/usr/lib/arch-backup/local
  install -D -m 0644 $srcdir/arch-backup-$pkgver/common.inc \
		     $pkgdir/usr/lib/arch-backup/common.inc
  install -D -m 0644 $srcdir/arch-backup-$pkgver/local-example.conf \
		     $pkgdir/etc/arch-backup/_local-example
  install -D -m 0644 $srcdir/arch-backup-$pkgver/ssh-example.conf \
		     $pkgdir/etc/arch-backup/_ssh-example
  install -D -m 0644 $srcdir/arch-backup-$pkgver/smb-example.conf \
		     $pkgdir/etc/arch-backup/_smb-example
  install -D -m 0644 $srcdir/arch-backup-$pkgver/arch-backup.8 \
		     $pkgdir/usr/share/man/man8/arch-backup.8
}
